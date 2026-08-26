import VersoBlog
import Course

open Verso Genre Blog Site Syntax
open Course

open Verso.Output Html in
private def weekRow (week : Week) : Html :=
  let detail :=
    match week.detail with
    | none => Html.empty
    | some detailText => {{ <span class="topic-detail">{{detailText}}</span> }}
  let milestone :=
    match week.milestone with
    | none => Html.empty
    | some (label, _) => {{ <span class="milestone">{{label}}</span> }}
  {{
    <tr>
      <td class="week">{{week.number}}</td>
      <td><strong>{{week.title}}</strong>{{detail}}</td>
      <td>{{milestone}}</td>
    </tr>
  }}

open Verso.Output Html in
private def bookItem (book : Book) : Html :=
  {{
    <li>
      <div class="book-title"><cite>{{book.title}}</cite> <span class="abbreviation">"("{{book.abbreviation}}")"</span></div>
      <div class="authors">"by "{{book.authors}}</div>
      <p>{{book.description}}</p>
      <div class="book-links">
        <a href={{book.readUrl}}>"read online"</a><span aria-hidden="true">"·"</span><a href={{book.codeUrl}}>"Lean files"</a>
      </div>
    </li>
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
          <meta name="description" content="Fall 2026 NYU course materials for Computer-Assisted Formalization of Mathematics, using Lean 4 and Mathlib."/>
          <meta name="theme-color" content="#f4f0e7"/>
          <meta property="og:title" content="Computer-Assisted Formalization of Mathematics"/>
          <meta property="og:description" content="Fall 2026 NYU course materials for formalizing mathematics in Lean 4."/>
          <meta property="og:type" content="website"/>
          <title>"Computer-Assisted Formalization of Mathematics · NYU"</title>
          <link rel="icon" href="assets/favicon.svg" type="image/svg+xml"/>
          <link rel="stylesheet" href="assets/styles.css"/>
        </head>
        <body>
          <a class="skip-link" href="#main-content">"Skip to content"</a>
          <div class="page-shell">
            <header class="course-header">
              <div class="header-line"><span>"New York University · Fall 2026"</span><a href="https://github.com/LeanNYU26">"LeanNYU26"</a></div>
              <h1>"Computer-Assisted Formalization "<em>"of Mathematics"</em></h1>
              <p class="course-listings">"DS-GA 3001 · 007 / MATH-GA 2650"</p>
              <nav aria-label="Course navigation">
                <a href="#course">"Course"</a>
                <a href="#schedule">"Schedule"</a>
                <a href="#work">"Work"</a>
                <a href="#reading">"Reading"</a>
                <a href="#contact">"Contact"</a>
              </nav>
            </header>

            <main id="main-content">
              <section id="course" aria-labelledby="course-heading">
                <h2 id="course-heading">"Course"</h2>
                <p class="lede">"This course concerns the formalization of mathematics in Lean 4 and Mathlib."</p>
                <p>"Topics include dependent type theory, mathematical libraries, functional programming, metaprogramming, proof automation, and AI-assisted theorem proving. Work in the course consists primarily of reading and writing Lean."</p>

                <dl class="course-meta">
                  <div><dt>"Lecture"</dt><dd>"Wednesdays, 10:15 am–12:15 pm"</dd></div>
                  <div><dt>"Room"</dt><dd>"12 Waverly Place, L120"</dd></div>
                  <div><dt>"Instructor"</dt><dd>"Jaume de Dios Pont · "<a href="mailto:jdedios@nyu.edu">"jdedios@nyu.edu"</a></dd></div>
                  <div><dt>"Office hours"</dt><dd>"Tuesdays, 4–5 pm · 60 Fifth Ave, 615"</dd></div>
                  <div><dt>"Section leader"</dt><dd>"Niket Patel · "<a href="mailto:nnp5656@nyu.edu">"nnp5656@nyu.edu"</a></dd></div>
                  <div><dt>"Recitation"</dt><dd>"Time and location to be announced"</dd></div>
                </dl>

                <aside class="open-note">
                  "The books and Lean worksheets linked below are public and may also be used for independent study."
                </aside>

                <h3>"Topics and skills"</h3>
                <ul class="plain-list">
                  <li>"Read, write, and debug Lean definitions, statements, and proofs."</li>
                  <li>"Work with propositions-as-types, dependent types, universes, and inductive types."</li>
                  <li>"Translate informal mathematics into precise, machine-checkable form."</li>
                  <li>"Find and reuse definitions and theorems in Mathlib."</li>
                  <li>"Understand simple metaprograms, tactics, automation, and AI-assisted proof methods."</li>
                </ul>

                <details>
                  <summary>"Background expected"</summary>
                  <p>"You should know one programming language, basic Git, elementary proof techniques, and proof-based calculus and linear algebra. No previous Lean experience is expected."</p>
                </details>
              </section>

              <section id="schedule" aria-labelledby="schedule-heading">
                <div class="section-heading"><h2 id="schedule-heading">"Schedule"</h2><span>"tentative · 14 weeks"</span></div>
                <table>
                  <caption class="visually-hidden">"Weekly course schedule"</caption>
                  <thead><tr><th scope="col">"Wk"</th><th scope="col">"Topic"</th><th scope="col">"Course work"</th></tr></thead>
                  <tbody>{{weeks.map weekRow}}</tbody>
                </table>
                <p class="small-note">"In weeks 10–14, recitation may split into an advanced mathematics track (for example topology and measure theory) and an AI4Lean track (proof search, agents, and reinforcement learning)."</p>
              </section>

              <section id="work" aria-labelledby="work-heading">
                <h2 id="work-heading">"Work"</h2>
                <div class="work-list">
                  <article><div><h3>"Homework"</h3><span>"20%"</span></div><p>"Four Lean worksheets, due at the end of weeks 2, 4, 6, and 8. Each follows recitation and prepares you for the next quiz."</p></article>
                  <article><div><h3>"Quizzes"</h3><span>"40%"</span></div><p>"Four short in-person quizzes—about 20 minutes each—in weeks 3, 5, 7, and 9."</p></article>
                  <article><div><h3>"Final project"</h3><span>"40%"</span></div><p>"A substantial formalization project. You should be ready to explain and work with every part of the resulting codebase."</p></article>
                </div>
                <p class="small-note"><strong>"AI and submitted work."</strong> " Homework and quizzes in weeks 1–8 are completed without generative AI. From week 9 onward, AI is welcome for the final project with detailed disclosure and full ownership of the result."</p>
              </section>

              <section id="reading" aria-labelledby="reading-heading">
                <div class="section-heading"><h2 id="reading-heading">"Reading and Lean worksheets"</h2><span>"open online"</span></div>
                <p>"The class draws from the following books and their corresponding Lean files."</p>
                <ol class="reading-list">{{courseBooks.map bookItem}}</ol>

                <h3>"Further references"</h3>
                <ol class="reading-list secondary">{{companionBooks.map bookItem}}</ol>

                <p class="tools"><strong>"Also useful:"</strong> " "<a href="https://lean-lang.org/install/">"install Lean"</a>", the "<a href="https://adam.math.hhu.de/">"Natural Number Game"</a>", and the "<a href="https://leanprover-community.github.io/mathlib4_docs/">"Mathlib documentation"</a>"."</p>
              </section>

              <section id="contact" aria-labelledby="contact-heading">
                <h2 id="contact-heading">"Contact"</h2>
                <p>"Questions about the course: "<a href="mailto:jdedios@nyu.edu">"jdedios@nyu.edu"</a>". Questions about recitation: "<a href="mailto:nnp5656@nyu.edu">"nnp5656@nyu.edu"</a>"."</p>
              </section>
            </main>

            <footer>
              <div class="verso-credit">{{versoCredit}}</div>
              <div class="footer-line"><span>"Last revised August 2026"</span><a href="https://github.com/LeanNYU26/computer-assisted-formalization">"source"</a></div>
            </footer>
          </div>
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
