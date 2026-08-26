import Course.Content
import VersoBlog

/-!
# Course theme

The shared HTML document shell and the home page's header and footer. Course prose does
not belong here; it arrives through Verso's standard `content` template parameter.
-/

namespace Course

open Verso Genre Blog
open Verso.Output Html Template Theme

private def documentTemplate : Template := do
  let title ← param (α := String) "title"
  let info := courseInfo
  return {{
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content={{s!"{info.term} {info.university} course schedule and materials for {title}."}}/>
        <meta name="theme-color" content="#ffffff"/>
        <title>{{title}}" · "{{info.term}}</title>
        {{← builtinHeader}}
        <link rel="icon" href="assets/favicon.svg" type="image/svg+xml"/>
        <link rel="stylesheet" href="assets/styles.css"/>
      </head>
      <body>{{← param "content"}}</body>
    </html>
  }}

private def homeTemplate : Template := do
  let content ← param "content"
  let title ← param (α := String) "title"
  let info := courseInfo
  return {{
    <a class="skip-link" href="#main-content">"Skip to main content"</a>
    <div class="site">
      <header class="site-header">
        <p class="university">{{info.university}}" · "{{info.term}}</p>
        <h1>{{title}}</h1>
        <p class="course-number">{{info.listings}}</p>
        <p class="meeting-line">{{info.lecture}}" · "{{info.location}}</p>
      </header>
      <main id="main-content">{{content}}</main>
      <footer>
        <div class="verso-credit"><p>"Powered by "<a href="https://github.com/leanprover/verso">"Verso"</a>" and "<a href="https://lean-lang.org/">"Lean"</a>"."</p></div>
        <p><a href={{info.sourceUrl}}>"Site source"</a></p>
      </footer>
    </div>
  }}

/-- The Verso theme used to render the course site. -/
def theme : Theme :=
  { Theme.default with primaryTemplate := documentTemplate }
    |>.override #[] { template := homeTemplate, params := id }

end Course
