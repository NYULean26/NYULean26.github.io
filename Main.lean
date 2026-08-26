import VersoBlog
import Course

open Verso Genre Blog Site Syntax
open Course

open Verso.Output Html in
private def courseLink (link : CourseLink) : Html :=
  {{ <span class="course-link"><a href={{link.url}}>{{link.label}}</a></span> }}

open Verso.Output Html in
private def linksOrDash (links : Array CourseLink) : Html :=
  if links.isEmpty then
    {{ <span class="empty">"—"</span> }}
  else
    {{ <span class="course-links">{{links.map courseLink}}</span> }}

open Verso.Output Html in
private def workOrDash (work : Option String) : Html :=
  match work with
  | none => {{ <span class="empty">"—"</span> }}
  | some workText => {{ <span>{{workText}}</span> }}

open Verso.Output Html in
private def meetingRow (meeting : Meeting) : Html :=
  let detail :=
    match meeting.detail with
    | none => Html.empty
    | some detailText => {{ <span class="meeting-detail">{{detailText}}</span> }}
  let week :=
    if meeting.number.isEmpty then Html.empty
    else {{ <span class="week-number">"W"{{meeting.number}}</span> }}
  let rowClass := if meeting.noClass then "no-class" else ""
  {{
    <tr class={{rowClass}}>
      <td class="date-cell"><time>{{meeting.date}}</time>{{week}}</td>
      <td class="topic-cell"><strong>{{meeting.title}}</strong>{{detail}}</td>
      <td class="reading-cell">{{linksOrDash meeting.readings}}</td>
      <td class="work-cell">{{workOrDash meeting.work}}</td>
    </tr>
  }}

open Verso.Output Html in
private def bookItem (book : Book) : Html :=
  {{
    <li>
      <cite>{{book.title}}</cite> <span class="abbreviation">"("{{book.abbreviation}}")"</span>
      <span class="book-author">" — "{{book.authors}}</span>
      <span class="book-links"><a href={{book.readUrl}}>"text"</a>" · "<a href={{book.codeUrl}}>"Lean files"</a></span>
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
          <meta name="description" content="Fall 2026 NYU course schedule and materials for Computer-Assisted Formalization of Mathematics."/>
          <meta name="theme-color" content="#ffffff"/>
          <title>"Computer-Assisted Formalization of Mathematics · Fall 2026"</title>
          <link rel="icon" href="assets/favicon.svg" type="image/svg+xml"/>
          <link rel="stylesheet" href="assets/styles.css"/>
        </head>
        <body>
          <a class="skip-link" href="#main-content">"Skip to course schedule"</a>
          <div class="site">
            <header class="site-header">
              <p class="university">"New York University · Fall 2026"</p>
              <h1>"Computer-Assisted Formalization of Mathematics"</h1>
              <p class="course-number">"DS-GA 3001 · 007 / MATH-GA 2650"</p>
              <p class="meeting-line">"Wednesdays, 10:15 am–12:15 pm · 12 Waverly Place, room L120"</p>
              <nav aria-label="Course page">
                <a href="#schedule">"Schedule"</a>
                <a href="#coursework">"Course work"</a>
                <a href="#books">"Books and files"</a>
                <a href="#information">"Information"</a>
              </nav>
            </header>

            <main id="main-content">
              <section id="announcements" class="announcements" aria-labelledby="announcements-heading">
                <h2 id="announcements-heading">"Announcements"</h2>
                <div class="announcement">
                  <time datetime="2026-08-26">"Aug 26"</time>
                  <p>"The first class is Wednesday, September 2. Bring a laptop. You can "<a href="https://lean-lang.org/install/">"install Lean and the VS Code extension"</a>" before class; we will begin with the "<a href="https://adam.math.hhu.de/">"Natural Number Game"</a>"."</p>
                </div>
              </section>

              <section id="schedule" aria-labelledby="schedule-heading">
                <h2 id="schedule-heading">"Schedule, readings, and files"</h2>
                <p class="section-note">"The plan is provisional. Lecture files and course worksheets will be added to the corresponding row as the semester runs."</p>
                <div class="table-wrap">
                  <table>
                    <caption class="visually-hidden">"Fall 2026 course schedule"</caption>
                    <thead><tr><th scope="col">"Date"</th><th scope="col">"Class"</th><th scope="col">"Read"</th><th scope="col">"Course work"</th></tr></thead>
                    <tbody>{{meetings.map meetingRow}}</tbody>
                  </table>
                </div>
                <p class="track-note"><strong>"Weeks 10–14."</strong> " Recitation may split into an advanced mathematics track (for example, topology and measure theory) and an AI4Lean track (proof search, agents, and reinforcement learning)."</p>
              </section>

              <section id="coursework" aria-labelledby="coursework-heading">
                <h2 id="coursework-heading">"Course work"</h2>
                <ul class="compact-list">
                  <li><strong>"Homework 1–4."</strong> " Lean worksheets due at the end of weeks 2, 4, 6, and 8. Submission is through Gradescope."</li>
                  <li><strong>"Quizzes 1–4."</strong> " Short in-person quizzes in recitation during weeks 3, 5, 7, and 9."</li>
                  <li><strong>"Final project."</strong> " A substantial Lean formalization. Project instructions and the due date will be posted here."</li>
                </ul>
              </section>

              <section id="books" aria-labelledby="books-heading">
                <h2 id="books-heading">"Books and Lean files"</h2>
                <p>"The course draws from these online books and their accompanying Lean repositories."</p>
                <h3>"Principal texts"</h3>
                <ul class="book-list">{{courseBooks.map bookItem}}</ul>
                <h3>"Additional references"</h3>
                <ul class="book-list">{{companionBooks.map bookItem}}</ul>

                <h3>"Setup and reference"</h3>
                <ul class="link-list">
                  <li><a href="https://lean-lang.org/install/">"Install Lean 4 and the VS Code extension"</a></li>
                  <li><a href="https://lean-lang.org/doc/reference/latest/">"Lean language reference"</a></li>
                  <li><a href="https://leanprover-community.github.io/mathlib4_docs/">"Mathlib documentation"</a></li>
                  <li><a href="https://github.com/LeanNYU26">"LeanNYU26 on GitHub"</a></li>
                </ul>
              </section>

              <section id="information" aria-labelledby="information-heading">
                <h2 id="information-heading">"Course information"</h2>
                <dl class="course-info">
                  <div><dt>"Instructor"</dt><dd>"Jaume de Dios Pont · "<a href="mailto:jdedios@nyu.edu">"jdedios@nyu.edu"</a></dd></div>
                  <div><dt>"Office hours"</dt><dd>"Tuesdays, 4–5 pm · 60 Fifth Avenue, office 615"</dd></div>
                  <div><dt>"Section leader"</dt><dd>"Niket Patel · "<a href="mailto:nnp5656@nyu.edu">"nnp5656@nyu.edu"</a></dd></div>
                  <div><dt>"Recitation"</dt><dd>"Time and room to be announced"</dd></div>
                </dl>
              </section>
            </main>

            <footer>
              <div class="verso-credit">{{versoCredit}}</div>
              <p><a href="https://github.com/LeanNYU26/computer-assisted-formalization">"Site source"</a>" · Last updated August 26, 2026"</p>
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
