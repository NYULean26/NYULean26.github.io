import Course.Content
import VersoBlog

/-!
# HTML components

Small renderers that turn the typed values in `Course.Content` into semantic HTML.
Private helpers render one item; public fragments are embedded in the Verso document
with its built-in `blob` directive.
-/

namespace Course.Components

open Verso.Output Html

private def resourceLink (link : ResourceLink) : Html :=
  {{ <span class="course-link"><a href={{link.url}}>{{link.label}}</a></span> }}

private def linksOrDash (links : Array ResourceLink) : Html :=
  if links.isEmpty then
    {{ <span class="empty">"—"</span> }}
  else
    {{ <span class="course-links">{{links.map resourceLink}}</span> }}

private def workOrDash (item : Option CourseWork) : Html :=
  match item with
  | none => {{ <span class="empty">"—"</span> }}
  | some ⟨label, none⟩ => {{ <span>{{label}}</span> }}
  | some ⟨label, some url⟩ => {{ <a href={{url}}>{{label}}</a> }}

private def meetingRow (meeting : Meeting) : Html :=
  let detail :=
    match meeting.detail with
    | none => Html.empty
    | some detailText => {{ <span class="meeting-detail">{{detailText}}</span> }}
  let (rowAttributes, week) :=
    match meeting.kind with
    | .lecture number => (#[], {{ <span class="week-number">{{s!"W{number}"}}</span> }})
    | .noClass => (#[("class", "no-class")], Html.empty)
  let resources := meeting.sourceMaterial ++ meeting.materials
  {{
    <tr {{rowAttributes}}>
      <td class="date-cell"><time datetime={{meeting.date.iso}}>{{meeting.date.label}}</time>{{week}}</td>
      <td class="topic-cell"><strong>{{meeting.title}}</strong>{{detail}}</td>
      <td class="material-cell">{{linksOrDash resources}}</td>
      <td class="work-cell">{{workOrDash meeting.work}}</td>
    </tr>
  }}

/-- The complete schedule table, generated from `Course.schedule`. -/
def scheduleTable : Html :=
  {{
    <div class="table-wrap">
      <table>
        <caption class="visually-hidden">{{s!"{Course.courseInfo.term} course schedule"}}</caption>
        <thead>
          <tr><th scope="col">"Date"</th><th scope="col">"Class"</th><th scope="col">"Source material / files"</th><th scope="col">"Course work"</th></tr>
        </thead>
        <tbody>{{Course.schedule.map meetingRow}}</tbody>
      </table>
    </div>
  }}

private def bookItem (book : Book) : Html :=
  {{
    <li>
      <cite>{{book.title}}</cite> <span class="abbreviation">"("{{book.abbreviation}}")"</span>
      <span class="book-author">" — "{{book.authors}}</span>
      <span class="book-links"><a href={{book.readUrl}}>"text"</a>" · "<a href={{book.codeUrl}}>"Lean files"</a></span>
    </li>
  }}

/-- The main book list, generated from `Course.principalTexts`. -/
def principalTextList : Html :=
  {{ <ul class="book-list">{{Course.principalTexts.map bookItem}}</ul> }}

/-- The supplementary book list, generated from `Course.additionalReferences`. -/
def additionalReferenceList : Html :=
  {{ <ul class="book-list">{{Course.additionalReferences.map bookItem}}</ul> }}

/-- Contact and meeting information generated from `Course.courseInfo`. -/
def courseInformation : Html :=
  let info := Course.courseInfo
  {{
    <dl class="course-info">
      <div><dt>"Instructor"</dt><dd>{{info.instructor.name}}" · "<a href=s!"mailto:{info.instructor.email}">{{info.instructor.email}}</a></dd></div>
      <div><dt>"Office hours"</dt><dd>{{info.officeHours}}</dd></div>
      <div><dt>"Section leader"</dt><dd>{{info.sectionLeader.name}}" · "<a href=s!"mailto:{info.sectionLeader.email}">{{info.sectionLeader.email}}</a></dd></div>
      <div><dt>"Lab"</dt><dd>{{info.lab}}</dd></div>
    </dl>
  }}

end Course.Components
