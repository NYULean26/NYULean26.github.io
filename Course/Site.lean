import Course.Home
import VersoBlog

/-!
# Site assembly

Connects the home page and static asset directory. URL structure belongs here; pairing
the site with its theme belongs in the executable entry point.
-/

namespace Course

open Verso Genre Blog Site Syntax

/-- The complete one-page course site. -/
def courseSite : Site := site Course.Home /
  static "assets" ← "assets"

end Course
