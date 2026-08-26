import Course.Model

/-!
# Fall 2026 course content

The editable facts that drive the website. Dates, topics, source material, books, and contact
details belong here. Ordinary page prose and HTML presentation do not.
-/

namespace Course

/-- Course identity, meeting details, staff, and repository links. -/
def courseInfo : CourseInfo := {
  university := "New York University"
  term := "Fall 2026"
  listings := "DS-GA 3001 · 007 / MATH-GA 2650"
  lecture := "Wednesdays, 10:15 am–12:15 pm"
  location := "12 Waverly Place, room L120"
  instructor := ⟨"Jaume de Dios Pont", "jdedios@nyu.edu"⟩
  officeHours := "Tuesdays, 4–5 pm · 60 Fifth Avenue, office 615"
  sectionLeader := ⟨"Niket Patel", "nnp5656@nyu.edu"⟩
  lab := "Thursdays, 11:15 am–12:05 pm · room to be announced"
  sourceUrl := "https://github.com/NYULean26/NYULean26.github.io"
}

private def date (iso label : String) : CourseDate := ⟨iso, label⟩

private def work (label : String) : CourseWork := ⟨label, none⟩

/-- The tentative Fall 2026 lecture schedule. -/
def schedule : Array Meeting := #[
  {
    date := date "2026-09-02" "Sep 2"
    kind := .lecture 1
    title := "Introduction to Lean"
    detail := some "Course organization; the editor and Infoview; the Natural Number Game."
    sourceMaterial := #[
      ⟨"FPiL 1", "https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/"⟩,
      ⟨"Natural Number Game", "https://adam.math.hhu.de/"⟩
    ]
    work := some (work "Lean setup")
  },
  {
    date := date "2026-09-09" "Sep 9"
    kind := .lecture 2
    title := "Propositions as types and proof terms"
    detail := some "Logical connectives, tactics, and examples from combinatorics."
    sourceMaterial := #[
      ⟨"TPiL 3–5", "https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/"⟩,
      ⟨"MiL 3", "https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html"⟩
    ]
    work := some (work "Homework 1")
  },
  {
    date := date "2026-09-16" "Sep 16"
    kind := .lecture 3
    title := "Dependent types and definitional equality"
    detail := some "Universes and polymorphism."
    sourceMaterial := #[
      ⟨"TPiL 2", "https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/"⟩
    ]
    work := some (work "Quiz 1")
  },
  {
    date := date "2026-09-23" "Sep 23"
    kind := .lecture 4
    title := "Induction and inductive types"
    detail := some "Proofs with inductive data."
    sourceMaterial := #[
      ⟨"TPiL 7–8", "https://lean-lang.org/theorem_proving_in_lean4/Inductive-Types/"⟩,
      ⟨"MiL 5", "https://leanprover-community.github.io/mathematics_in_lean/C05_Elementary_Number_Theory.html"⟩
    ]
    work := some (work "Homework 2")
  },
  {
    date := date "2026-09-30" "Sep 30"
    kind := .lecture 5
    title := "Structures, typeclasses, and inheritance"
    sourceMaterial := #[
      ⟨"TPiL 9–10", "https://lean-lang.org/theorem_proving_in_lean4/Structures-and-Records/"⟩,
      ⟨"FPiL 3", "https://lean-lang.org/functional_programming_in_lean/Overloading-and-Type-Classes/"⟩
    ]
    work := some (work "Quiz 2")
  },
  {
    date := date "2026-10-07" "Oct 7"
    kind := .lecture 6
    title := "Mathlib and Lean libraries"
    detail := some "Finding lemmas; algebraic structures in Lean."
    sourceMaterial := #[
      ⟨"MiL 2", "https://leanprover-community.github.io/mathematics_in_lean/C02_Basics.html"⟩,
      ⟨"MiL 7–9", "https://leanprover-community.github.io/mathematics_in_lean/C07_Structures.html"⟩
    ]
    work := some (work "Homework 3")
  },
  {
    date := date "2026-10-14" "Oct 14"
    kind := .noClass
    title := "No class"
    detail := some "Legislative Day: NYU follows a Monday schedule."
  },
  {
    date := date "2026-10-21" "Oct 21"
    kind := .lecture 7
    title := "Elementary analysis and optimization in Lean"
    sourceMaterial := #[
      ⟨"MiL 11–12", "https://leanprover-community.github.io/mathematics_in_lean/C11_Topology.html"⟩
    ]
    work := some (work "Quiz 3")
  },
  {
    date := date "2026-10-28" "Oct 28"
    kind := .lecture 8
    title := "Executable code in Lean"
    detail := some "Monads and functional programs."
    sourceMaterial := #[
      ⟨"FPiL 4–6", "https://lean-lang.org/functional_programming_in_lean/Monads/"⟩
    ]
    work := some (work "Homework 4")
  },
  {
    date := date "2026-11-04" "Nov 4"
    kind := .lecture 9
    title := "Proofs about code"
    detail := some "Introduction to operational semantics and Hoare logic."
    sourceMaterial := #[
      ⟨"LoVe 9–10", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some (work "Quiz 4")
  },
  {
    date := date "2026-11-11" "Nov 11"
    kind := .lecture 10
    title := "Lean under the hood"
    detail := some "Axioms and Lean's trust surface."
    sourceMaterial := #[
      ⟨"TPiL 12", "https://lean-lang.org/theorem_proving_in_lean4/Axioms-and-Computation/"⟩,
      ⟨"LoVe 12", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some (work "Make-up quizzes")
  },
  {
    date := date "2026-11-18" "Nov 18"
    kind := .lecture 11
    title := "Metaprogramming in Lean"
    detail := some "Expressions, syntax, elaboration, and macros."
    sourceMaterial := #[
      ⟨"MPiL", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some (work "Project work")
  },
  {
    date := date "2026-11-25" "Nov 25"
    kind := .lecture 12
    title := "Proof automation"
    detail := some "Certificates and proofs by reflection."
    sourceMaterial := #[
      ⟨"MPiL: tactics", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some (work "Project work")
  },
  {
    date := date "2026-12-02" "Dec 2"
    kind := .lecture 13
    title := "Agentic Lean proof generation I"
    work := some (work "Project work")
  },
  {
    date := date "2026-12-09" "Dec 9"
    kind := .lecture 14
    title := "Agentic Lean proof generation II"
    work := some (work "Project work")
  }
]

/-- The four books from which the course draws most directly. -/
def principalTexts : Array Book := #[
  {
    abbreviation := "MiL"
    title := "Mathematics in Lean"
    authors := "Jeremy Avigad and Patrick Massot"
    readUrl := "https://leanprover-community.github.io/mathematics_in_lean/"
    codeUrl := "https://github.com/leanprover-community/mathematics_in_lean"
  },
  {
    abbreviation := "TPiL"
    title := "Theorem Proving in Lean 4"
    authors := "Jeremy Avigad, Leonardo de Moura, Soonho Kong, Sebastian Ullrich, with contributions from the Lean Community"
    readUrl := "https://lean-lang.org/theorem_proving_in_lean4/"
    codeUrl := "https://github.com/leanprover/theorem_proving_in_lean4"
  },
  {
    abbreviation := "FPiL"
    title := "Functional Programming in Lean"
    authors := "David Thrane Christiansen"
    readUrl := "https://lean-lang.org/functional_programming_in_lean/"
    codeUrl := "https://github.com/leanprover/fp-lean"
  },
  {
    abbreviation := "MPiL"
    title := "Metaprogramming in Lean 4"
    authors := "Arthur Paulino, Damiano Testa, Edward Ayers, Evgenia Karunus, Henrik Böving, Jannis Limperg, Siddhartha Gadgil, and Siddharth Bhat"
    readUrl := "https://leanprover-community.github.io/lean4-metaprogramming-book/"
    codeUrl := "https://github.com/leanprover-community/lean4-metaprogramming-book"
  }
]

/-- Two useful references that complement the principal texts. -/
def additionalReferences : Array Book := #[
  {
    abbreviation := "MoP"
    title := "The Mechanics of Proof"
    authors := "Heather Macbeth"
    readUrl := "https://hrmacbeth.github.io/math2001/"
    codeUrl := "https://github.com/hrmacbeth/math2001"
  },
  {
    abbreviation := "LoVe"
    title := "The Hitchhiker's Guide to Logical Verification — 2026 edition"
    authors := "Anne Baanen, Alexander Bentkamp, Jasmin Blanchette, Xavier Généreux, Johannes Hölzl, and Jannis Limperg"
    readUrl := "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"
    codeUrl := "https://github.com/lean-forward/logical_verification_2026/tree/main/lean/LoVe"
  }
]

end Course
