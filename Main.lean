import VersoBlog
import Course

open Verso Genre Blog Site Syntax
open Course

open Verso.Output Html in
private def weekRow (week : Week) : Html :=
  let detail :=
    match week.detail with
    | none => Html.empty
    | some detailText => {{ <span>{{detailText}}</span> }}
  let milestone :=
    match week.milestone with
    | none => Html.empty
    | some (label, kind) => {{ <span class={{kind}}>{{label}}</span> }}
  {{
    <tr class="schedule-row" data-reveal>
      <td class="week">{{week.number}}</td>
      <td class="schedule-topic"><strong>{{week.title}}</strong>{{detail}}</td>
      <td>{{milestone}}</td>
    </tr>
  }}

open Verso.Output Html in
private def bookCard (book : Book) : Html :=
  {{
    <article class="book-card" data-reveal>
      <div class="book-top">
        <span class="book-abbr">{{book.abbreviation}}</span>
        <span class="book-kind">"Course text"</span>
      </div>
      <h3>{{book.title}}</h3>
      <p class="book-authors">{{book.authors}}</p>
      <p class="book-description">{{book.description}}</p>
      <div class="book-actions">
        <a href={{book.readUrl}}>"Read online "<span aria-hidden="true">"↗"</span></a>
        <a href={{book.codeUrl}}>"Lean files "<span aria-hidden="true">"↗"</span></a>
      </div>
    </article>
  }}

open Verso.Output Html in
private def companionCard (book : Book) : Html :=
  {{
    <article class="companion-card" data-reveal>
      <span class="book-abbr">{{book.abbreviation}}</span>
      <div>
        <h3>{{book.title}}</h3>
        <p class="book-authors">{{book.authors}}</p>
        <p>{{book.description}}</p>
        <div class="book-actions">
          <a href={{book.readUrl}}>"Read "<span aria-hidden="true">"↗"</span></a>
          <a href={{book.codeUrl}}>"Worksheets "<span aria-hidden="true">"↗"</span></a>
        </div>
      </div>
    </article>
  }}

open Verso.Output Html Template Theme in
def courseTheme : Theme := { Theme.default with
  primaryTemplate := do
    let versoCredit ← param "content"
    return {{
      <html lang="en">
        <head>
          <meta charset="utf-8"/>
          <meta name="viewport" content="width=device-width, initial-scale=1"/>
          <meta name="description" content="Learn mathematics with Lean 4, Mathlib, and AI-assisted theorem proving—whether you are enrolled at NYU or following along independently."/>
          <meta name="theme-color" content="#10182c"/>
          <meta property="og:title" content="Computer-Assisted Formalization of Mathematics"/>
          <meta property="og:description" content="A Fall 2026 NYU learning community for formalizing mathematics in Lean 4."/>
          <meta property="og:type" content="website"/>
          <title>"Computer-Assisted Formalization of Mathematics · NYU"</title>
          <link rel="icon" href="assets/favicon.svg" type="image/svg+xml"/>
          <link rel="stylesheet" href="assets/styles.css"/>
        </head>
        <body>
          <a class="skip-link" href="#main-content">"Skip to main content"</a>

          <header class="site-header" data-site-header>
            <div class="nav-shell">
              <a class="wordmark" href="#top" aria-label="Course home">
                <span class="wordmark-mark" aria-hidden="true">"⊢"</span>
                <span>"Lean @ NYU"</span>
              </a>
              <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="primary-navigation" data-nav-toggle>
                <span class="sr-only">"Open navigation"</span><span></span><span></span><span></span>
              </button>
              <nav id="primary-navigation" class="primary-nav" aria-label="Primary navigation" data-nav>
                <a href="#overview">"Overview"</a>
                <a href="#schedule">"Schedule"</a>
                <a href="#community">"Join in"</a>
                <a href="#assignments">"Assignments"</a>
                <a href="#resources">"Books"</a>
                <a class="nav-pill" href="https://lean-lang.org/install/">"Get Lean "<span aria-hidden="true">"↗"</span></a>
              </nav>
            </div>
          </header>

          <main id="main-content">
            <section class="hero" id="top" aria-labelledby="course-title">
              <div class="hero-grid" aria-hidden="true"></div>
              <div class="hero-glow hero-glow-one" aria-hidden="true"></div>
              <div class="hero-glow hero-glow-two" aria-hidden="true"></div>
              <div class="container hero-layout">
                <div class="hero-copy" data-reveal>
                  <p class="eyebrow"><span>"Fall 2026"</span>" · Enrolled or simply curious—welcome"</p>
                  <h1 id="course-title">"Computer-Assisted"<br/>"Formalization "<em>"of Mathematics"</em></h1>
                  <p class="hero-lede">"Turn mathematical ideas into precise definitions and proofs that a machine can check. This is a learning space for NYU students and everyone following along independently."</p>
                  <div class="hero-actions">
                    <a class="button button-primary" href="#schedule">"See the learning path "<span aria-hidden="true">"↓"</span></a>
                    <a class="button button-ghost" href="#resources">"Open the books"</a>
                  </div>
                  <ul class="course-codes">
                    <li>"DS-GA 3001 · 007"</li><li>"MATH-GA 2650"</li>
                  </ul>
                </div>

                <div class="proof-card" data-reveal>
                  <div class="proof-card-bar">
                    <span class="proof-dot"></span><span class="proof-dot"></span><span class="proof-dot"></span>
                    <span class="proof-file">"Course.lean"</span>
                  </div>
                  <pre><code><span class="code-keyword">"theorem"</span>" learning_outcome\n    (idea : Mathematics) :\n    Formalized idea := "<span class="code-keyword">"by"</span>"\n  "<span class="code-tactic">"refine"</span>" ⟨precision, ?_⟩\n  "<span class="code-tactic">"apply"</span>" machine_checked\n  "<span class="code-comment">"-- no gaps, no ambiguity"</span>"\n  "<span class="code-tactic">"exact"</span>" proof"</code></pre>
                  <div class="proof-status"><span aria-hidden="true">"✓"</span>" Build completed successfully"</div>
                </div>
              </div>
            </section>

            <section class="facts-band" aria-label="Course details">
              <div class="container fact-grid">
                <div class="fact" data-reveal><span class="fact-kicker">"Lecture"</span><strong>"Wednesdays"</strong><span>"10:15 am–12:15 pm"</span></div>
                <div class="fact" data-reveal><span class="fact-kicker">"Location"</span><strong>"12 Waverly Place"</strong><span>"Room L120"</span></div>
                <div class="fact" data-reveal><span class="fact-kicker">"Instructor"</span><strong>"Jaume de Dios Pont"</strong><a href="mailto:jdedios@nyu.edu">"jdedios@nyu.edu"</a></div>
                <div class="fact" data-reveal><span class="fact-kicker">"Community"</span><strong>"Two ways to participate"</strong><span>"Enrolled or following along"</span></div>
              </div>
            </section>

            <section class="section overview" id="overview" aria-labelledby="overview-title">
              <div class="container">
                <div class="section-heading split-heading" data-reveal>
                  <div><p class="eyebrow dark">"Course overview"</p><h2 id="overview-title">"Mathematics,"<br/><em>"made executable."</em></h2></div>
                  <div class="heading-copy">
                    <p>"We will encode definitions, statements, and proofs in Lean 4, with machine-checked guarantees of correctness."</p>
                    <p>"Along the way, we will study dependent type theory, the architecture of Mathlib, functional programming, metaprogramming, and modern AI-assisted proof search."</p>
                  </div>
                </div>
                <div class="outcomes-layout">
                  <aside class="terminal-card" data-reveal aria-label="Course philosophy">
                    <div class="terminal-top"><span>"why_lean.md"</span><span>"×"</span></div>
                    <div class="terminal-body"><span class="terminal-prompt">"$"</span><p>"A proof assistant turns rigor from an aspiration into a compile-time guarantee."</p><span class="terminal-cursor" aria-hidden="true"></span></div>
                  </aside>
                  <div class="outcomes">
                    <h3 data-reveal>"What you will learn to do"</h3>
                    <ol class="outcome-list">
                      <li data-reveal><span>"01"</span><p><strong>"Read, write, and debug Lean 4"</strong>", from definitions and theorem statements to complete proofs."</p></li>
                      <li data-reveal><span>"02"</span><p><strong>"Reason with Lean’s foundations"</strong>", including propositions-as-types, dependent types, universes, and inductive types."</p></li>
                      <li data-reveal><span>"03"</span><p><strong>"Translate informal mathematics"</strong>" into machine-checkable statements and critically assess formalizations."</p></li>
                      <li data-reveal><span>"04"</span><p><strong>"Navigate and reuse Mathlib"</strong>", recognizing its abstractions and adapting results to new problems."</p></li>
                      <li data-reveal><span>"05"</span><p><strong>"Extend and evaluate the prover"</strong>" through metaprogramming, tactics, automation, and AI-assisted methods."</p></li>
                    </ol>
                  </div>
                </div>
              </div>
            </section>

            <section class="section community" id="community" aria-labelledby="community-title">
              <div class="container">
                <div class="section-heading split-heading" data-reveal>
                  <div><p class="eyebrow dark">"Learn with us"</p><h2 id="community-title">"One course."<br/><em>"Two ways in."</em></h2></div>
                  <div class="heading-copy"><p>"Formal enrollment is not the boundary of this learning community. The course is designed for students completing the NYU course and independent learners working through the same ideas."</p><p>"Come for the mathematics, the programming, the formal methods, or the AI. The common goal is to learn by doing."</p></div>
                </div>
                <div class="participation-grid">
                  <article class="participation-card enrolled" data-reveal><span class="participation-label">"Enrolled at NYU"</span><h3>"Take the course"</h3><p>"Join lecture and recitation, complete the four homework–quiz cycles, and build a substantial final project."</p><a href="#assignments">"See course milestones "<span aria-hidden="true">"↓"</span></a></article>
                  <article class="participation-card following" data-reveal><span class="participation-label">"Not enrolled"</span><h3>"Follow along"</h3><p>"Use the weekly schedule as your roadmap, work through the open books and Lean worksheets, and learn at your own pace."</p><a href="#resources">"Open the book shelf "<span aria-hidden="true">"↓"</span></a></article>
                </div>
                <div class="weekly-rhythm" data-reveal>
                  <div class="rhythm-intro"><span>"This course, week to week"</span><strong>"Learn → try → formalize → share"</strong></div>
                  <div><span>"01"</span><strong>"Learn the idea"</strong><p>"Follow the weekly concept and examples."</p></div>
                  <div><span>"02"</span><strong>"Try it in Lean"</strong><p>"Open an editor and make the proof compile."</p></div>
                  <div><span>"03"</span><strong>"Go deeper"</strong><p>"Use recitation or open readings to explore."</p></div>
                  <div><span>"04"</span><strong>"Build"</strong><p>"Turn small proofs into a real formalization."</p></div>
                </div>
              </div>
            </section>

            <section class="section prerequisites" aria-labelledby="prerequisites-title">
              <div class="container prerequisite-grid">
                <div class="section-heading" data-reveal><p class="eyebrow dark">"Before you begin"</p><h2 id="prerequisites-title">"Bring curiosity."<br/><em>"And a few basics."</em></h2><p class="section-intro">"No previous Lean experience is expected."</p></div>
                <div class="prerequisite-cards">
                  <article class="mini-card" data-reveal><span class="mini-icon" aria-hidden="true">"{ }"</span><h3>"Programming"</h3><p>"Familiarity with at least one programming language."</p></article>
                  <article class="mini-card" data-reveal><span class="mini-icon" aria-hidden="true">"git"</span><h3>"Version control"</h3><p>"Ability to perform basic Git operations. You may learn this during week one, but it will not be taught in class."</p></article>
                  <article class="mini-card" data-reveal><span class="mini-icon" aria-hidden="true">"∀"</span><h3>"Proofs and logic"</h3><p>"Comfort with logical statements and elementary techniques such as induction and contradiction."</p></article>
                  <article class="mini-card" data-reveal><span class="mini-icon" aria-hidden="true">"∫"</span><h3>"Mathematics"</h3><p>"Elementary proof-based calculus and linear algebra, including limits, determinants, and rank–nullity."</p></article>
                </div>
              </div>
            </section>

            <section class="section schedule-section" id="schedule" aria-labelledby="schedule-title">
              <div class="container">
                <div class="section-heading schedule-heading" data-reveal><div><p class="eyebrow light">"14-week arc"</p><h2 id="schedule-title">"From first proof"<br/><em>"to proof agents."</em></h2></div><p>"The schedule is tentative and may evolve with the pace and interests of the learning community."</p></div>
                <table class="schedule-table">
                  <caption class="sr-only">"Weekly course schedule"</caption>
                  <thead><tr class="schedule-row schedule-header"><th scope="col">"Week"</th><th scope="col">"Theme"</th><th scope="col">"Milestone"</th></tr></thead>
                  <tbody>{{weeks.map weekRow}}</tbody>
                </table>
                <div class="callout" data-reveal><span class="callout-icon" aria-hidden="true">"↳"</span><div><strong>"Two possible tracks, weeks 10–14"</strong><p>"The recitation may split into advanced mathematics—topology, measure theory, and more—and AI4Lean, focused on automated proof search and reinforcement learning."</p></div></div>
              </div>
            </section>

            <section class="section assessment" id="assignments" aria-labelledby="assignments-title">
              <div class="container">
                <div class="section-heading split-heading" data-reveal><div><p class="eyebrow dark">"Learning milestones"</p><h2 id="assignments-title">"Practice often."<br/><em>"Build something real."</em></h2></div><div class="heading-copy"><p>"For enrolled students, these are graded course components. If you are following independently, use the same milestones as a suggested pace—not as a finish line."</p></div></div>
                <div class="milestone-grid">
                  <article class="milestone-card" data-reveal><div><span>"Weeks 2 · 4 · 6 · 8"</span><strong>"20%"</strong></div><h3>"Homework"</h3><p>"Four Lean worksheets that follow the recitation material and prepare you for the next quiz."</p></article>
                  <article class="milestone-card" data-reveal><div><span>"Weeks 3 · 5 · 7 · 9"</span><strong>"40%"</strong></div><h3>"Quizzes"</h3><p>"Four short, in-person checks—about 20 minutes each—on the core ideas and techniques."</p></article>
                  <article class="milestone-card final-project" data-reveal><div><span>"Second half"</span><strong>"40%"</strong></div><h3>"Final project"</h3><p>"Choose a real formalization problem, build it in Lean, and be ready to explain every part of the resulting codebase."</p></article>
                </div>
                <div class="ai-boundary" data-reveal><span class="mini-icon" aria-hidden="true">"AI"</span><div><strong>"For submitted work"</strong><p>"Weeks 1–8 build fluency without generative AI in homework or quizzes. From week 9 onward, AI is welcomed for the final project with detailed disclosure and full ownership of the result."</p></div></div>
              </div>
            </section>

            <section class="section resources" id="resources" aria-labelledby="resources-title">
              <div class="container">
                <div class="section-heading resource-heading" data-reveal><div><p class="eyebrow light">"Read · open · compile"</p><h2 id="resources-title">"Books paired with"<br/><em>"working Lean."</em></h2></div><p>"The class draws from four open books and their corresponding Lean examples or worksheets. Read with an editor open: the code is part of the text."</p></div>
                <div class="books-heading" data-reveal><span>"Core course texts"</span><span>"4 books · all open online"</span></div>
                <div class="book-grid">{{courseBooks.map bookCard}}</div>
                <div class="books-heading companion-heading" data-reveal><span>"Valuable companions"</span><span>"Proof craft · logical verification"</span></div>
                <div class="companion-grid">{{companionBooks.map companionCard}}</div>
                <div class="toolkit" data-reveal>
                  <div><span>"01"</span><strong>"Install Lean 4"</strong><a href="https://lean-lang.org/install/">"Setup guide ↗"</a></div>
                  <div><span>"02"</span><strong>"Natural Number Game"</strong><a href="https://adam.math.hhu.de/">"Play online ↗"</a></div>
                  <div><span>"03"</span><strong>"Mathlib documentation"</strong><a href="https://leanprover-community.github.io/mathlib4_docs/">"Search the library ↗"</a></div>
                </div>
                <div class="resource-note" data-reveal><span>"Weekly reading and worksheet pointers will be added as the semester approaches."</span><span class="status-pill"><i></i>" Course site in progress"</span></div>
              </div>
            </section>

            <section class="verso-credit" aria-label="Site technology"><div class="container">{{versoCredit}}</div></section>

            <section class="section contact" aria-labelledby="contact-title">
              <div class="container contact-card" data-reveal>
                <div><p class="eyebrow dark">"Questions?"</p><h2 id="contact-title">"Let’s talk Lean."</h2></div>
                <div class="contact-details">
                  <div><span>"Instructor"</span><strong>"Jaume de Dios Pont"</strong><a href="mailto:jdedios@nyu.edu">"jdedios@nyu.edu"</a></div>
                  <div><span>"Section leader"</span><strong>"Niket Patel"</strong><a href="mailto:nnp5656@nyu.edu">"nnp5656@nyu.edu"</a></div>
                  <div><span>"Recitation and TA hours"</span><strong>"To be announced"</strong><span>"Details forthcoming"</span></div>
                </div>
              </div>
            </section>
          </main>

          <footer class="site-footer"><div class="container footer-inner"><a class="wordmark footer-wordmark" href="#top"><span class="wordmark-mark" aria-hidden="true">"⊢"</span><span>"Lean @ NYU"</span></a><p>"Computer-Assisted Formalization of Mathematics · Fall 2026"</p><a href="#top">"Back to top "<span aria-hidden="true">"↑"</span></a></div></footer>
          <script src="assets/script.js"></script>
        </body>
      </html>
    }}
  }
  |>.override #[] {
    template := do return {{ {{← param "content"}} }},
    params := id
  }

def courseSite : Site := site Course.FrontPage /
  static "assets" ← "assets"

def main := blogMain courseTheme courseSite
