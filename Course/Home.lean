import Course.Components
import VersoBlog

/-!
# Home page

The course page in the same order that readers see it. Most prose edits belong here;
the data-driven schedule, book lists, and information table are imported as typed HTML
fragments from `Course.Components`.
-/

open Verso Genre Blog

#doc (Page) "Computer-Assisted Formalization of Mathematics" =>

# Announcements
%%%
htmlId := some "announcements"
%%%

:::html div (class := "announcement")

*Aug 26*

The first class is Wednesday, September 2. Bring a laptop. Before class, you can try to [install Lean and the VS Code extension](https://lean-lang.org/install/), but we will not need it on the first day. We will begin with the [Natural Number Game](https://adam.math.hhu.de/).

:::

# Schedule, readings, and files
%%%
htmlId := some "schedule"
%%%

:::htmlDiv (class := "section-note")

The plan is provisional. Lecture files and course worksheets will be added to the corresponding row as the semester runs.

:::

:::blob Course.Components.scheduleTable
:::

:::htmlDiv (class := "track-note")

*Weeks 10–14.* The lab may split into an advanced mathematics track (for example, topology and measure theory) and an AI4Lean track (proof search, agents, and reinforcement learning).

:::

# Course work
%%%
htmlId := some "coursework"
%%%

:::htmlDiv (class := "compact-list")

* *Homework 1–4.* Lean worksheets due at the end of weeks 2, 4, 6, and 8. Submission is through Gradescope.
* *Quizzes 1–4.* Short in-person quizzes in lab during weeks 3, 5, 7, and 9.
* *Final project.* A substantial Lean formalization. Project instructions and the due date will be posted here.

:::

# Books and Lean files
%%%
htmlId := some "books"
%%%

The course draws from these online books and their accompanying Lean repositories.

## Principal texts
%%%
htmlId := some "principal-texts"
%%%

:::blob Course.Components.principalTextList
:::

## Additional references
%%%
htmlId := some "additional-references"
%%%

:::blob Course.Components.additionalReferenceList
:::

## Setup and reference
%%%
htmlId := some "setup-and-reference"
%%%

:::htmlDiv (class := "link-list")

* [Install Lean 4 and the VS Code extension](https://lean-lang.org/install/)
* [Lean language reference](https://lean-lang.org/doc/reference/latest/)
* [Mathlib documentation](https://leanprover-community.github.io/mathlib4_docs/)
* [NYULean26 on GitHub](https://github.com/NYULean26)

:::

# Course information
%%%
htmlId := some "information"
%%%

:::blob Course.Components.courseInformation
:::
