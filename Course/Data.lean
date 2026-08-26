namespace Course

structure CourseLink where
  label : String
  url : String

structure Meeting where
  number : String
  date : String
  title : String
  detail : Option String := none
  readings : Array CourseLink := #[]
  work : Option String := none
  noClass : Bool := false

def meetings : Array Meeting := #[
  {
    number := "1"
    date := "Sep 2"
    title := "Introduction to Lean"
    detail := some "Course organization; the editor and Infoview; the Natural Number Game."
    readings := #[
      ⟨"FPiL 1", "https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/"⟩,
      ⟨"Natural Number Game", "https://adam.math.hhu.de/"⟩
    ]
    work := some "Lean setup"
  },
  {
    number := "2"
    date := "Sep 9"
    title := "Propositions as types and proof terms"
    detail := some "Logical connectives, tactics, and examples from combinatorics."
    readings := #[
      ⟨"TPiL 3–5", "https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/"⟩,
      ⟨"MiL 3", "https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html"⟩
    ]
    work := some "Homework 1"
  },
  {
    number := "3"
    date := "Sep 16"
    title := "Dependent types and definitional equality"
    detail := some "Universes and polymorphism."
    readings := #[
      ⟨"TPiL 2", "https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/"⟩
    ]
    work := some "Quiz 1"
  },
  {
    number := "4"
    date := "Sep 23"
    title := "Induction and inductive types"
    detail := some "Proofs with inductive data."
    readings := #[
      ⟨"TPiL 7–8", "https://lean-lang.org/theorem_proving_in_lean4/Inductive-Types/"⟩,
      ⟨"MiL 5", "https://leanprover-community.github.io/mathematics_in_lean/C05_Elementary_Number_Theory.html"⟩
    ]
    work := some "Homework 2"
  },
  {
    number := "5"
    date := "Sep 30"
    title := "Structures, typeclasses, and inheritance"
    readings := #[
      ⟨"TPiL 9–10", "https://lean-lang.org/theorem_proving_in_lean4/Structures-and-Records/"⟩,
      ⟨"FPiL 3", "https://lean-lang.org/functional_programming_in_lean/Overloading-and-Type-Classes/"⟩
    ]
    work := some "Quiz 2"
  },
  {
    number := "6"
    date := "Oct 7"
    title := "Mathlib and Lean libraries"
    detail := some "Finding lemmas; algebraic structures in Lean."
    readings := #[
      ⟨"MiL 2", "https://leanprover-community.github.io/mathematics_in_lean/C02_Basics.html"⟩,
      ⟨"MiL 7–9", "https://leanprover-community.github.io/mathematics_in_lean/C07_Structures.html"⟩
    ]
    work := some "Homework 3"
  },
  {
    number := ""
    date := "Oct 14"
    title := "No class"
    detail := some "Legislative Day: NYU follows a Monday schedule."
    noClass := true
  },
  {
    number := "7"
    date := "Oct 21"
    title := "Elementary analysis and optimization in Lean"
    readings := #[
      ⟨"MiL 11–12", "https://leanprover-community.github.io/mathematics_in_lean/C11_Topology.html"⟩
    ]
    work := some "Quiz 3"
  },
  {
    number := "8"
    date := "Oct 28"
    title := "Executable code in Lean"
    detail := some "Monads and functional programs."
    readings := #[
      ⟨"FPiL 4–6", "https://lean-lang.org/functional_programming_in_lean/Monads/"⟩
    ]
    work := some "Homework 4"
  },
  {
    number := "9"
    date := "Nov 4"
    title := "Proofs about code"
    detail := some "Introduction to operational semantics and Hoare logic."
    readings := #[
      ⟨"LoVe 9–10", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some "Quiz 4"
  },
  {
    number := "10"
    date := "Nov 11"
    title := "Lean under the hood"
    detail := some "Axioms and Lean's trust surface."
    readings := #[
      ⟨"TPiL 12", "https://lean-lang.org/theorem_proving_in_lean4/Axioms-and-Computation/"⟩,
      ⟨"LoVe 12", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some "Make-up quizzes"
  },
  {
    number := "11"
    date := "Nov 18"
    title := "Metaprogramming in Lean"
    detail := some "Expressions, syntax, elaboration, and macros."
    readings := #[
      ⟨"MPiL", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some "Project work"
  },
  {
    number := "12"
    date := "Nov 25"
    title := "Proof automation"
    detail := some "Certificates and proofs by reflection."
    readings := #[
      ⟨"MPiL: tactics", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some "Project work"
  },
  {
    number := "13"
    date := "Dec 2"
    title := "Agentic Lean proof generation I"
    work := some "Project work"
  },
  {
    number := "14"
    date := "Dec 9"
    title := "Agentic Lean proof generation II"
    work := some "Project work"
  }
]

structure Book where
  abbreviation : String
  title : String
  authors : String
  readUrl : String
  codeUrl : String

def courseBooks : Array Book := #[
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

def companionBooks : Array Book := #[
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
