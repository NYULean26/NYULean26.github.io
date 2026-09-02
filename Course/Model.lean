/-!
# Course site model

Domain types for the course website. This module deliberately has no dependency on
Verso or HTML: it describes the information on the site, not how that information is
rendered.
-/

namespace Course

/-- A labeled link to source material, a worksheet, or another course resource. -/
structure ResourceLink where
  label : String
  url : String

/-- A lecture file together with its repository and browser-editor links. -/
structure LectureFile where
  name : String
  githubUrl : String
  liveUrl : String

/-- A date represented both for readers and for HTML's machine-readable `datetime`. -/
structure CourseDate where
  iso : String
  label : String

/-- Whether a schedule row is a numbered lecture or a day on which class does not meet. -/
inductive MeetingKind where
  | lecture (week : Nat)
  | noClass

/-- A course-work milestone, optionally linked once its file or instructions are posted. -/
structure CourseWork where
  label : String
  url : Option String := none

/-- One row in the semester schedule. -/
structure Meeting where
  date : CourseDate
  kind : MeetingKind
  title : String
  detail : Option String := none
  application : Option String := none
  lectureFile : Option LectureFile := none
  sourceMaterial : Array ResourceLink := #[]
  materials : Array ResourceLink := #[]
  work : Option CourseWork := none

/-- A book used by the course together with its online text and Lean source files. -/
structure Book where
  abbreviation : String
  title : String
  authors : String
  readUrl : String
  codeUrl : String

/-- A member of the course staff. -/
structure Contact where
  name : String
  email : String
  website : Option String := none

/-- Stable facts used in the page header, information table, and footer. -/
structure CourseInfo where
  university : String
  term : String
  listings : String
  lecture : String
  location : String
  instructor : Contact
  officeHours : String
  teachingAssistant : Contact
  discussion : String
  discussionLocation : ResourceLink
  zoomUrl : String
  syllabusUrl : String
  sourceUrl : String

end Course
