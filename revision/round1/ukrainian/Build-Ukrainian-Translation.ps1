[CmdletBinding()]
param(
    [string] $OutputDirectory = (Join-Path $PSScriptRoot 'build')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$xelatex = (Get-Command xelatex -CommandType Application | Select-Object -First 1).Source
$bibtex = (Get-Command bibtex -CommandType Application | Select-Object -First 1).Source
$outputPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputDirectory)
$work = Join-Path ([IO.Path]::GetTempPath()) ('dudyk-ua-' + [guid]::NewGuid())
$manuscript = 'IJF_Manuscript_UA'
$response = 'IJF_Response_to_Reviewers_UA'
$sourceFiles = @(
    "$manuscript.tex", "$response.tex", 'UA_Preamble.tex',
    'UA1_Sections_1-3.tex', 'UA2_Sections_4-6.tex', 'UA3_Appendix_and_Declarations.tex',
    'references.bib', 'sn-mathphys-ay.bst', 'Fig1.pdf', 'Fig2.pdf', 'Fig3.pdf', 'Fig4.pdf'
)

function Invoke-BuildCommand {
    param([string] $Program, [string[]] $Arguments)

    & $Program @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Program exited with code $LASTEXITCODE."
    }
}

function Invoke-XeLaTeX {
    param([string] $Document)

    Invoke-BuildCommand $xelatex @(
        '-interaction=nonstopmode', '-halt-on-error', '-file-line-error', "$Document.tex"
    )
}

New-Item -ItemType Directory -Path $work | Out-Null
Push-Location $work
try {
    foreach ($name in $sourceFiles) {
        Copy-Item -LiteralPath (Join-Path $PSScriptRoot $name) -Destination $work
    }
    Invoke-XeLaTeX $manuscript
    Invoke-BuildCommand $bibtex @($manuscript)
    Invoke-XeLaTeX $manuscript
    Invoke-XeLaTeX $manuscript
    Invoke-XeLaTeX $manuscript
    Invoke-XeLaTeX $response
    Invoke-XeLaTeX $response

    $logFiles = @("$manuscript.log", "$manuscript.blg", "$response.log")
    $blockingPattern = 'undefined (citations|references)|(?:Citation|Reference) .{0,100} undefined|Missing character:|duplicate ignored|[Ii]gnoring duplicate destination|No hyphenation patterns|I didn.t find a database entry|Label\(s\) may have changed'
    foreach ($log in $logFiles) {
        $issue = Select-String -LiteralPath $log -Pattern $blockingPattern | Select-Object -First 1
        if ($null -ne $issue) {
            throw "$log reports a build problem. $($issue.Line)"
        }
    }

    New-Item -ItemType Directory -Path $outputPath -Force | Out-Null
    foreach ($name in @("$manuscript.pdf", "$response.pdf") + $logFiles) {
        Copy-Item -LiteralPath $name -Destination (Join-Path $outputPath $name) -Force
    }
    foreach ($document in @($manuscript, $response)) {
        $hash = Get-FileHash -Algorithm SHA256 (Join-Path $outputPath "$document.pdf")
        Write-Output "$($hash.Hash)  $document.pdf"
    }
}
finally {
    Pop-Location
    Remove-Item -LiteralPath $work -Recurse -Force
}
