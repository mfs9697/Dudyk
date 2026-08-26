from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def read(path):
    return (ROOT / path).read_text(encoding='utf-8')


def write(path, text):
    (ROOT / path).write_text(text, encoding='utf-8')


def must_replace(text, old, new, label):
    if old not in text:
        raise RuntimeError(f'Missing expected text: {label}')
    print(f'{label}: {text.count(old)} replacement(s)')
    return text.replace(old, new)

# 1. More positive novelty wording in the Introduction.
p = 'manuscript/latex/sections/01_introduction.tex'
t = read(p)
t = must_replace(
    t,
    'Таким чином, ні відхилення\nміжфазної тріщини від межі, ні його процес-зонне моделювання самі по собі\nне становлять новизни цієї роботи; визначальною є конкретна початкова\nконфігурація і механічний перехід до відгалуження.',
    'Ці результати формують методичну основу для подальшого розвитку\nпроцес-зонного підходу. Специфіка цієї роботи визначається вихідною\nконфігурацією контактуючих міжфазних зсувних тріщин у кутовій точці\nламаної межі та механічним переходом до відгалуження.',
    'Introduction novelty wording')
write(p, t)

# 2, 3, 6, 10. Global terminology/notation in active manuscript TeX.
tex_paths = list((ROOT / 'manuscript/latex').rglob('*.tex'))
for f in tex_paths:
    t = f.read_text(encoding='utf-8')
    t = t.replace('бісектриса\nвідповідного матеріалу', 'бісектриса кутового сектора,\nзайнятого цим матеріалом')
    t = t.replace('бісектриса відповідного матеріалу', 'бісектриса кутового сектора, зайнятого цим матеріалом')
    t = t.replace('бісектрисі матеріалу, в якому', 'бісектрисі кутового сектора матеріалу, в якому')
    t = t.replace('бісектрисі матеріалу $i$', 'бісектрисі кутового сектора матеріалу $i$')
    t = t.replace('бісектриси одного з матеріалів', 'бісектриси кутового сектора одного з матеріалів')
    t = re.sub(r"найвід[’']ємніший дійсний корінь", 'найменший дійсний корінь', t)

    # Stress terminology and grammar.
    t = t.replace('стала відривна напруга', 'стале відривне напруження')
    t = t.replace('сталої відривної напруги', 'сталого відривного напруження')
    t = t.replace('сталою відривною напругою', 'сталим відривним напруженням')
    t = t.replace('відривна напруга', 'відривне напруження')
    t = t.replace('відривної напруги', 'відривного напруження')
    t = t.replace('відривною напругою', 'відривним напруженням')
    t = re.sub(r'\bнапруга\b', 'напруження', t)
    t = re.sub(r'\bнапруги\b', 'напруження', t)
    t = re.sub(r'\bнапругу\b', 'напруження', t)
    t = re.sub(r'\bнапругою\b', 'напруженням', t)
    t = re.sub(r'\bнапрузі\b', 'напруженні', t)

    # Upright descriptive indices; material index i stays italic.
    t = t.replace('J_{ic}', r'J_{i\mathrm{c}}')
    t = t.replace(r'\delta_{ic}', r'\delta_{i\mathrm{c}}')
    t = t.replace(r'K_{II}', r'K_{\mathrm{II}}')
    f.write_text(t, encoding='utf-8')

# 4. Closure condition and dedicated author query.
p = 'manuscript/latex/sections/02_problem_statement.tex'
t = read(p)
t = must_replace(
    t,
    'Невідому довжину $d_i$ визначаємо з умови усунення кореневої\nсингулярності\n\\begin{equation*}\n  k_i=0,\n\\end{equation*}\nяка замикає сформульовану крайову задачу.',
    'Для замикання крайової задачі далі використовується умова усунення\nкореневого сингулярного доданка\n\\begin{equation*}\n  k_i=0.\n\\end{equation*}\n\n\\AuthorQuery{AQ-PS-02}{У тексті я відокремив вимогу обмеженості напружень\nвід додаткової умови $k_i=0$: обмеженість сама по собі не означає\nнульового напруження, тоді як $k_i=0$ зануляє коефіцієнт кореневого\nсингулярного доданка і використовується для визначення $d_i$. Чи\nправильно саме так трактувати умову замикання крайової задачі? Якщо так,\nчи можна додати коротке фізичне обґрунтування або посилання на роботу, де\nця умова використовується для визначення довжини зони передруйнування?}',
    'process-zone closure wording')
t = t.replace('Чи правильно ми розуміємо', 'Чи правильно я розумію')
t = t.replace('нам здається', 'мені здається')
write(p, t)

p = 'manuscript/latex/sections/03_process_zone_parameters.tex'
t = read(p)
t = must_replace(
    t,
    'Умова обмеженості напружень $k_i=0$ визначає довжину зони:',
    'Накладаючи умову $k_i=0$, тобто усуваючи кореневий сингулярний доданок у прийнятій асимптотиці, отримуємо рівняння для довжини зони:',
    'boundedness wording')
t = t.replace('\nВідновлений множник $\\sigma_i^2$ забезпечує правильну розмірність як\n$W_i$, так і $J_i$.\n', '\n')
write(p, t)

# 7--9. Version-neutral numerical prose and singular author voice.
p = 'manuscript/latex/sections/04_numerical_results.tex'
t = read(p)
t = must_replace(
    t,
    "У новій авторській редакції запропоновано інтерпретувати графіки\n$\\delta_i'$ і $J_i'$ також як основу відповідно деформаційного та\nенергетичного критеріїв зародження відгалуженої тріщини.",
    "Окремо розглядається можливість інтерпретації графіків $\\delta_i'$ і\n$J_i'$ як основи відповідно деформаційного та енергетичного критеріїв\nзародження відгалуженої тріщини.",
    'version-neutral criterion prose')
t = t.replace('Під час редакційної перевірки ми незалежно', 'Під час редакційної перевірки я незалежно')
t = t.replace('ми не використовуємо,\nпропонуємо', 'в цій роботі не використовується,\nпропоную')
old = r'''\AuthorQuery{AQ-NR-02}{У новій редакції максимум $J_i$ при певних кутах
інтерпретовано як ``найменшу тріщиностійкість з'єднання''. Чи Ви маєте на
увазі не зміну матеріальної тріщиностійкості $J_{i\mathrm{c}}$, а найменше
критичне зовнішнє навантаження, необхідне для ініціювання відгалуження за
фіксованого $J_{i\mathrm{c}}$? Ми пропонуємо саме так сформулювати цей результат.}'''
new = r'''\AuthorQuery{AQ-NR-02}{Чи правильно трактувати максимум $J_i$ при певних
кутах не як ``найменшу тріщиностійкість з'єднання'', а як прояв більшої
рушійної сили відгалуження і, за фіксованого $J_{i\mathrm{c}}$, нижчого
критичного зовнішнього навантаження? Я пропоную саме так сформулювати цей
результат.}'''
t = must_replace(t, old, new, 'version-neutral AQ-NR-02')
t = t.replace('Ми схиляємося до', 'Я схиляюся до')
write(p, t)

# 5. Figure 1: move O, theta, alpha clear of geometry.
p = 'manuscript/latex/figures/figure1_original_tikz.tex'
t = read(p)
t = must_replace(t, r'\node[font=\small] at (0.64,0.08) {$\theta$};', r'\node[font=\small,fill=white,inner sep=.7pt] at (0.93,0.18) {$\theta$};', 'Fig1 theta')
t = must_replace(t, r'\node[font=\small] at (-0.03,0.74) {$\alpha$};', r'\node[font=\small,fill=white,inner sep=.7pt] at (0.16,0.88) {$\alpha$};', 'Fig1 alpha')
t = must_replace(t, r'\node[font=\small] at (-0.18,-0.20) {$O$};', r'\node[font=\small,fill=white,inner sep=.7pt] at (0.18,-0.20) {$O$};', 'Fig1 O')
write(p, t)

# 9. Reviewer-oriented author queries: singular voice.
p = 'manuscript/latex/notes/reviewer_queries.tex'
t = read(p)
t = t.replace('Як рецензент, ми бачимо тут потенційне питання:', 'Під час редакційного перегляду я бачу тут потенційне питання:')
t = t.replace('а в нашій роботі будується', 'а в цій роботі будується')
t = t.replace('пропонуємо обережніше', 'пропоную обережніше')
t = t.replace('на нашу думку', 'на мою думку')
t = t.replace('просимо вказати', 'прошу вказати')
write(p, t)

# Mirror query wording in the register.
p = 'docs/AUTHOR_QUERIES.md'
t = read(p)
t = t.replace('Чи правильно ми розуміємо', 'Чи правильно я розумію')
t = t.replace('нам здається', 'мені здається')
t = t.replace('Під час редакційної перевірки ми незалежно', 'Під час редакційної перевірки я незалежно')
t = t.replace('ми не використовуємо, пропонуємо', 'в цій роботі не використовується, пропоную')
t = t.replace('Ми схиляємося до', 'Я схиляюся до')
t = t.replace('Як рецензент, ми бачимо тут потенційне питання:', 'Під час редакційного перегляду я бачу тут потенційне питання:')
t = t.replace('а в нашій роботі будується', 'а в цій роботі будується')
t = t.replace('пропонуємо обережніше', 'пропоную обережніше')
t = t.replace('на нашу думку', 'на мою думку')
t = t.replace('просимо вказати', 'прошу вказати')
t = t.replace('J_{ic}', r'J_{i\mathrm{c}}')
t = t.replace(r'\delta_{ic}', r'\delta_{i\mathrm{c}}')
t = t.replace(r'K_{II}', r'K_{\mathrm{II}}')
# Version-neutral AQ-NR-02 in the register.
t = re.sub(
    r'\*\*Питання автору\.\*\* У новій редакції максимум \$J_i\$ при певних кутах інтерпретовано як «найменшу тріщиностійкість з\'єднання»\.[^\n]+',
    '**Питання автору.** Чи правильно трактувати максимум $J_i$ при певних кутах не як «найменшу тріщиностійкість з\'єднання», а як прояв більшої рушійної сили відгалуження і, за фіксованого $J_{i\\mathrm{c}}$, нижчого критичного зовнішнього навантаження? Я пропоную саме так сформулювати цей результат.',
    t)
marker = '### AQ-PS-02 — closure condition at the process-zone tip\n'
if marker not in t:
    anchor = 'Status: **open; inserted inline in the problem statement**.\n\n'
    start = t.find('### AQ-PS-01')
    pos = t.find(anchor, start)
    if pos < 0:
        raise RuntimeError('Cannot place AQ-PS-02 in AUTHOR_QUERIES.md')
    pos += len(anchor)
    aq = '''### AQ-PS-02 — closure condition at the process-zone tip

**Питання автору.** У тексті я відокремив вимогу обмеженості напружень від додаткової умови $k_i=0$: обмеженість сама по собі не означає нульового напруження, тоді як $k_i=0$ зануляє коефіцієнт кореневого сингулярного доданка і використовується для визначення $d_i$. Чи правильно саме так трактувати умову замикання крайової задачі? Якщо так, чи можна додати коротке фізичне обґрунтування або посилання на роботу, де ця умова використовується для визначення довжини зони передруйнування?

Status: **open; inserted inline after the process-zone-tip asymptotics**.

'''
    t = t[:pos] + aq + t[pos:]
write(p, t)

# Audit active TeX after modifications.
active = '\n'.join(f.read_text(encoding='utf-8') for f in tex_paths)
if re.search(r'\bнапруг(?:а|и|у|ою|і)\b', active):
    raise RuntimeError('Uncorrected Ukrainian stress terminology remains')
if re.search(r"найвід[’']ємніш", active):
    raise RuntimeError('Nonstandard root wording remains')
if 'J_{ic}' in active or r'\delta_{ic}' in active or r'K_{II}' in active:
    raise RuntimeError('Descriptor-index italics remain')

print('Editorial correction batch completed successfully.')
