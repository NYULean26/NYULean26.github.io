namespace Course

structure Week where
  number : String
  title : String
  detail : Option String := none
  milestone : Option (String × String) := none

def weeks : Array Week := #[
  ⟨"01", "Introduction to Lean", some "The Natural Number Game", some ("Foundations", "phase phase-foundations")⟩,
  ⟨"02", "Propositions as types and proof terms", some "Some proofs in combinatorics", some ("Homework 1", "due")⟩,
  ⟨"03", "Dependent types and definitional equality", some "Universes and polymorphism", some ("Quiz 1", "due quiz")⟩,
  ⟨"04", "Induction and inductive types", some "Proofs with inductive data", some ("Homework 2", "due")⟩,
  ⟨"05", "Structures, typeclasses and inheritance", none, some ("Quiz 2", "due quiz")⟩,
  ⟨"06", "Mathlib and Lean libraries", some "Algebraic structures in Lean", some ("Homework 3", "due")⟩,
  ⟨"07", "Elementary analysis and optimization", none, some ("Quiz 3", "due quiz")⟩,
  ⟨"08", "Executable code in Lean", some "Monads", some ("Homework 4", "due")⟩,
  ⟨"09", "Proofs about code", some "Introduction to Hoare logic", some ("Quiz 4", "due quiz")⟩,
  ⟨"10", "Lean under the hood", some "Axioms and the trust surface of Lean", some ("Make-up quizzes", "phase phase-systems")⟩,
  ⟨"11", "Metaprogramming in Lean", none, some ("Systems", "phase phase-systems")⟩,
  ⟨"12", "Proof automation", some "Certificates and proofs by reflection", some ("Automation", "phase phase-systems")⟩,
  ⟨"13", "Agentic Lean proof generation I", none, some ("AI + Lean", "phase phase-ai")⟩,
  ⟨"14", "Agentic Lean proof generation II", none, some ("AI + Lean", "phase phase-ai")⟩
]

structure Book where
  abbreviation : String
  title : String
  authors : String
  description : String
  readUrl : String
  codeUrl : String

def courseBooks : Array Book := #[
  {
    abbreviation := "MiL"
    title := "Mathematics in Lean"
    authors := "Jeremy Avigad and Patrick Massot"
    description := "Mathematical formalization with Mathlib, taught through worked examples and exercises."
    readUrl := "https://leanprover-community.github.io/mathematics_in_lean/"
    codeUrl := "https://github.com/leanprover-community/mathematics_in_lean"
  },
  {
    abbreviation := "TPiL"
    title := "Theorem Proving in Lean 4"
    authors := "Jeremy Avigad, Leonardo de Moura, Soonho Kong, Sebastian Ullrich, and the Lean Community"
    description := "Lean’s logical foundations, core language, tactics, induction, structures, and typeclasses."
    readUrl := "https://lean-lang.org/theorem_proving_in_lean4/"
    codeUrl := "https://github.com/leanprover/theorem_proving_in_lean4"
  },
  {
    abbreviation := "FPiL"
    title := "Functional Programming in Lean"
    authors := "David Thrane Christiansen"
    description := "Lean as a programming language: types, monads, dependent programs, proofs, and performance."
    readUrl := "https://lean-lang.org/functional_programming_in_lean/"
    codeUrl := "https://github.com/leanprover/fp-lean"
  },
  {
    abbreviation := "MPiL"
    title := "Metaprogramming in Lean 4"
    authors := "Arthur Paulino, Damiano Testa, Edward Ayers, Evgenia Karunus, Henrik Böving, Jannis Limperg, Siddhartha Gadgil, and Siddharth Bhat"
    description := "Expressions, metaprograms, syntax, elaboration, macros, tactics, and domain-specific languages."
    readUrl := "https://leanprover-community.github.io/lean4-metaprogramming-book/"
    codeUrl := "https://github.com/leanprover-community/lean4-metaprogramming-book"
  }
]

def companionBooks : Array Book := #[
  {
    abbreviation := "MoP"
    title := "The Mechanics of Proof"
    authors := "Heather Macbeth"
    description := "A careful introduction to mathematical proof, paired throughout with Lean code."
    readUrl := "https://hrmacbeth.github.io/math2001/"
    codeUrl := "https://github.com/hrmacbeth/math2001"
  },
  {
    abbreviation := "LoVe"
    title := "The Hitchhiker’s Guide to Logical Verification — 2026"
    authors := "Anne Baanen, Alexander Bentkamp, Jasmin Blanchette, Xavier Généreux, Johannes Hölzl, and Jannis Limperg"
    description := "A broad guide to theorem proving, functional programming, semantics, Hoare logic, and foundations."
    readUrl := "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"
    codeUrl := "https://github.com/lean-forward/logical_verification_2026/tree/main/lean/LoVe"
  }
]

end Course
