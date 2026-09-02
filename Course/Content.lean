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
  instructor := {
    name := "Jaume de Dios Pont"
    email := "jdedios@nyu.edu"
  }
  officeHours := "Tuesdays, 4–5 pm · 60 Fifth Avenue, office 615"
  teachingAssistant := {
    name := "Niket Patel"
    email := "nnp5656@nyu.edu"
    website := some "https://cds.nyu.edu/team/niket-patel/"
  }
  discussion := "Thursdays, 11:15 am–12:05 pm"
  discussionLocation := {
    label := "Tisch Hall (40 W 4th St), room LC9"
    url := "https://www.google.com/maps/search/40+W+4th+St?entry=gmail&source=g"
  }
  zoomUrl := "https://nyu.zoom.us/j/97327526479"
  syllabusUrl := "assets/syllabus-fall-2026.pdf"
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
    detail := some "Expressions, definitions, theorem statements, the editor, and Infoview."
    application := some "Elementary arithmetic with the Natural Number Game."
    lectureFile := some {
      name := "Lecture01.lean"
      githubUrl := "https://github.com/NYULean26/Lectures/blob/main/Week%2001/Lecture01.lean"
      liveUrl := "https://live.lean-lang.org/#project=MathlibDemo&codez=LTAEBEGVgcQQVAZgAzIIygO2lQdlAPSgCycAKgBKwIBMAbAKzIBQIoAwgPYC2ADgK4AXAKYAnYHADOkgJaSRAE1AAxTqO4BDADYyAXhsEzOAO1CcAZiQMALYZsMBjSazAAZYQ8H9RwnGgBcoABCGrJOZpbuGsYuoACVoABSGvzcvgq%2B4EaSoDTI9MzMMnxqglaC1joARoUgdfUNjU3NscgAdKBktqAAbmIAnr0DoFWhMuEWoFExzbNzTbVuwtGgCpzCOdyc8qAOPAKCBkbGORW%2BAO4ag%2F2c%2FKDCAB68HoJtsWScoJLCvmegPpJ%2BFoypMNLt9kIjiYADSgc6iGQiUAAYmEPW0zFR6K0uQA1DRYuwdA4ANZmUx%2FfjGDKiHTGYRKKpafgXNQKN5sLq%2BAFAsoaXjPDSiSQdEygP4IgDm1jK1miSlkGTesWmq3WOWMnDK%2FG%2BoF4QuExjO31Onwy5hk9NA5ipnmO92x%2FChJ0xaO0oE0D1yoAALItQAB1XwOFbmy2%2BG3GO0mHLnRHWVbCczMc3W0AACi9gUAqIQASlA%2FgAvKBQF7caA0IUse7LIhQGw%2FbEAJKmaawtEDCqWyWgOU5MGCfrPZVsIO7FY63zIhy2Uniz4zjxkv6D54RUArR68AGyEyYxdz5PvbqrjYbnxDUSDBxaba%2FT7nOVlc6%2BOV9UBaZaiI2xKpCcVPgA5BqWoblolz9DklpeIiMh9FWbo4umiD%2BHm9ZgF0cigFhfzGAY3jusYqRVGISCutiGYoYAuIT5py1hYTh3Q%2BIRxGkYgHQBk%2B2H9v8yw4kR3AkaIAD8hRifMEmSbEaAdAACqInA9N2AHCGodixvGvHwoiGwuJJ%2BkLLExA2NUvahBuH6gaCWjMQogzbophoqWp3D9tSiYWsYsExrEQT%2Fmc%2FSAReOpOloWiDJIIZXlWB5ktwQIAPqhJInAOCWbDxcCMi8MSzrcRu0ipTIRzvpaXx2DIkoKfwvDONOs5xYlezcNw6Eery2W5YYYpYc18WHIYpWmH1kKDb4miSpozgqsspgkpq5w5NYnDnPOoAAER7GIDjCOtKnOT4rnYUanyauo7ohiazDogiGhMr46ZglUuwFqANFtU2lgvh54YWc9aXmcxOI3cV911bFGaZUlhUAyMuy0UsKzzStORURm2mCCIpgADoAEr5lhYIjQNcG%2BN83CVdVvBiceqmHf2F4OX0phVIMgiiNEkjmGoFPGD2fySpw2gcmARLjGSYpgvIwi8OufwORYsKCJ83y%2FN08gGL4kzywpFiLFyWkIkioirQA2m0FsALrihodppZ%2Bgg5Dcdw%2BBjau%2BIL7o6spm5PDuxzMI8Gh8J%2BGZPS9gTvYEbUAGpCqDn7OCWyfJ2CABUcMZ2lxbPRnj2gFn%2BZtXsUbMruMQpynRYjP0zAliboCm1DfV%2FZbdf%2FGbUPJalcNE23hRByHD3h2lSiR0XlfpWAce3WD7eT%2Bm1hDq92eZxZE9tRQQ5arYV2TyWi9DoBr3IKAxbpyM%2Bb%2BPPler6fbBcKX3t7vvBY57X9dm0vvDW2wrtG2eb2fMLLfx3hsOQ7cUqiCvMXEwhgiLuz1LrSwzthTCC0OYAAhGJT8LUwTcH6ElBQCgEqAmeumXG%2FgyBDmEPmU2uNlK4zbq%2FFhYc4aBHxgWG%2BKcwTlmeuWYAz1z5vxrpAtQMC2Ds0GCbYSa1Qhkm5qIDa%2F8dKnC4vIcW60aZ6QMvUaSbQMAG3YNoNKhw7Y6N0SAAeDxg45WENwjMMBXrUOeHQmAVNQAwGtvnf6r0YAI1ADPBOukF7WACCMNOYJixoHzIvGggQNBp1XjEwIbAt68DAXvSuVRCxpVgU%2FaQAdJ7V1Zm1SAhxRAgksArZMk8QxaDSqOXwhoRBKKJiYoEeUakOJLEIiJGAq7vy%2BOIwYbBJwbXokaPaahlHnGEntGQKDbhqmMIBMoyNVqPgMGtNYPTQAJTPhEx6SSr5DKgRI4AeyDnFnTFUSJuYkkiNKec0ZlzX7XIrI8wZNdhnQNeVcw5eTK4lIiiMtqUiNpVUtAoPaijVhCjihoSU4waaWN0fomgoAmwh3GM6NySh6SSjxRYtF8x%2FSfX2iXG8z9TCE1pTikM3VjCwm%2BiGWlRoFIKH4DtfaoDjQQMHnYthz1x6vSiXDQASYQWXLBgHOoAZVPI%2Fsddmnw5Q1BLC88SYAABywgiVMthHAAUXVjiwkgM8BwxUdD6CZbEAAqrqAABiYYQCV6QJV0GITgjrYSOs9QpIhChHWBxsUPUAABvSwkdQBSqogAXwzNYKNoBAAARKWSOsJLBlgrIc5AV80x1kAAZEOBFXtzYOmAANaAOApyMwIClcobQ3xcxlrAOmBAxagi1qre2w5Xb27QQUr2AkU9QDO3HKYSQFqrV6EQQoAwYJJh8t3iEr407tCzt7LWMRfytWkr0WwGSdYACKTojSLJkGIHI6ZADARNCFNLb90NHJZYM4F5CbWjUNoHEZU%2FhUrLqauEvhB2cC5Tyv4IM7qJ2VZ8P4U7bb2MFZ%2BduFDAguNoY3BhwCmHXxLGm8OHDYS8LhgIuG5924goHRyz44c2DfRA2B3wYJ5QjB3Rcsdyy2WgHGfyHKgwm6ENwZoa2ysNzGsGGCITGhYSyAploIU4U1oNzhVuf2PlmxfVfBod8onJDLVWilNIXZgGPDkI7FlEZoXYT5O5dak4FmCBDbY5DB9KGdBoXQrDPYcPtxvaAXQhHU2ljHa9XGsIHhp10Ic%2FokWKPvzY7XDTQHQAbOGUZyZPZTPyEkBZidZgqiHDKoia%2BSH7EHw0OPFDkgACOTofCBD85IfwVEiOHMkAAPRoLmXDG5ACmRDgOLoiSycAKxoMqgAL8i%2BLCawORACX5CImrdWyu%2FPY%2F%2FAB3HZDAJm0R9yPHxOyNE55JQkm7CaH9AATWWXp24WglDGYlpYME61FHfr2uZfB%2FJrQKVapuXBLS5HggKQHUrKGYBUI843dxtxZZeJQ2yFCQXrCBBgNN9rdZCwpPbmmyU%2FgUegElO1ughyMCUZLCB%2FH7d6mNLecnAnRObkE8QLmTriqVtKpLB89MMSWcgrZ21NYoBNTal1JM2UYhhCwkRPj0msZhAyFEAqLw5hanJw%2BSTs5IytUVjaD6CASZLTeRdGi%2F0CAwxeSZflD7stzDff2qeU0FkHIZNkLalMSYRi3GpAyDM5ho2xvzfJTgssiy%2BZIBmoLDxmuwgAD5Zuj6AQAJkQkH9AAUQeNtOQ9i3eWBLvA%2FgtxJBJTKOmX3b0Y1vViZHqOoBA%2FB%2BLGzwoqZc%2BWnzzqH3fuK%2BvVrwtzXhQzguUB3ngvReErNVlpG%2FHr00axoTeGrMb04030Xsm5vRFh%2FbKzS2lOi8eyBFX63wv2yewl9LLmK%2BN99%2Fr%2BLz2QAGETWnzFmDXu7%2FSQB4L4U98uSQ5EmNMclrZZrWi2hMoMz3iHBIQBTnjpD670hKAqZ9AwKWgHCPpgCfgaAKDKS6Zv6gC1af7TTVhIQk6gCABYhPmEQKfKOiwORO6HWGAAwCwmwMgLCCRCGOMsaExheNqvhBzFoHgYhKAPgAAKQlqvxsC4DWLOa%2BAcJ8RtA1aVIZjAAxK5qDalJQrUj%2BjKDeBvrjgmiBAtgiBVTuiTCajGDADQR6ocz3SAFRjAGS7GDwHwI9hB5iAGBqAihvBAA"
    }
    sourceMaterial := #[
      ⟨"FPiL 1", "https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/"⟩,
      ⟨"Natural Number Game", "https://adam.math.hhu.de/"⟩
    ]
    work := some (work "Lean setup")
  },
  {
    date := date "2026-09-09" "Sep 9"
    kind := .lecture 2
    title := "Logic, proof terms, and tactics"
    detail := some "Proofs as terms; logical connectives; forward and backward reasoning."
    application := some "Proofs in elementary logic and combinatorics. Two ways of writing proofs in Lean."
    sourceMaterial := #[
      ⟨"TPiL 3–5", "https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/"⟩,
      ⟨"MiL 3", "https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html"⟩
    ]
    work := some (work "Homework 1")
  },
  {
    date := date "2026-09-16" "Sep 16"
    kind := .lecture 3
    title := "Dependent type theory"
    detail := some "Dependent functions, definitional equality, polymorphism, and universes."
    application := some "Types as specifications: subtypes, vectors, matrices, & continuous functions."
    sourceMaterial := #[
      ⟨"TPiL 2", "https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/"⟩
    ]
    work := some (work "Quiz 1")
  },
  {
    date := date "2026-09-23" "Sep 23"
    kind := .lecture 4
    title := "Inductive types, recursion, and induction"
    detail := some "Inductive data and propositions; structural recursion and induction."
    application := some "Proving theorems about lists and trees."
    sourceMaterial := #[
      ⟨"TPiL 7–8", "https://lean-lang.org/theorem_proving_in_lean4/Inductive-Types/"⟩,
      ⟨"MiL 5", "https://leanprover-community.github.io/mathematics_in_lean/C05_Elementary_Number_Theory.html"⟩
    ]
    work := some (work "Homework 2")
  },
  {
    date := date "2026-09-30" "Sep 30"
    kind := .lecture 5
    title := "Structures, typeclasses, and algebraic structures"
    detail := some "Instances, inheritance, synthesis, and generic theorems."
    application := some "Build a small hierarchy of algebraic structures."
    sourceMaterial := #[
      ⟨"TPiL 9–10", "https://lean-lang.org/theorem_proving_in_lean4/Structures-and-Records/"⟩,
      ⟨"FPiL 3", "https://lean-lang.org/functional_programming_in_lean/Overloading-and-Type-Classes/"⟩
    ]
    work := some (work "Quiz 2")
  },
  {
    date := date "2026-10-07" "Oct 7"
    kind := .lecture 6
    title := "Linear algebra in Mathlib"
    detail := some "Mathlib's algebraic hierarchy, coercions, and generic theorems."
    application := some "An application of linear algebra: Linear regression and least squares."
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
    title := "Working effectively with Mathlib"
    detail := some "Finding definitions and lemmas; namespaces, rewriting, and automation."
    application := some "Analysis and optimization examples."
    sourceMaterial := #[
      ⟨"MiL 11–12", "https://leanprover-community.github.io/mathematics_in_lean/C11_Topology.html"⟩
    ]
    work := some (work "Quiz 3")
  },
  {
    date := date "2026-10-28" "Oct 28"
    kind := .lecture 8
    title := "Executable Lean and monads"
    detail := some "Option, Except, State, do notation, and IO."
    application := some "Turn the linear algebra and optimization examples into executable code."
    sourceMaterial := #[
      ⟨"FPiL 4–6", "https://lean-lang.org/functional_programming_in_lean/Monads/"⟩
    ]
    work := some (work "Homework 4")
  },
  {
    date := date "2026-11-04" "Nov 4"
    kind := .lecture 9
    title := "Program verification"
    detail := some "Specifications, correctness, termination, and inductive semantics."
    application := some "Operational semantics and Hoare logic."
    sourceMaterial := #[
      ⟨"LoVe 9–10", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some (work "Quiz 4")
  },
  {
    date := date "2026-11-11" "Nov 11"
    kind := .lecture 10
    title := "Lean under the hood"
    detail := some "Syntax, macros, elaboration, expressions, and kernel checking."
    application := some "Build a small language inside Lean."
    sourceMaterial := #[
      ⟨"TPiL 12", "https://lean-lang.org/theorem_proving_in_lean4/Axioms-and-Computation/"⟩,
      ⟨"LoVe 12", "https://github.com/lean-forward/logical_verification_2026/blob/main/hitchhikers_guide_2026_desktop.pdf"⟩
    ]
    work := some (work "Make-up quizzes")
  },
  {
    date := date "2026-11-18" "Nov 18"
    kind := .lecture 11
    title := "Tactic metaprogramming"
    detail := some "Goals, metavariables, expressions, and recursive tactics."
    application := some "Build a small positivity tactic."
    sourceMaterial := #[
      ⟨"MPiL", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some (work "Project work")
  },
  {
    date := date "2026-11-25" "Nov 25"
    kind := .lecture 12
    title := "Trusted proof automation"
    detail := some "Reflection, certificates, and the boundary between trusted and untrusted computation."
    application := some "Build a small sum-of-squares certificate checker."
    sourceMaterial := #[
      ⟨"MPiL: tactics", "https://leanprover-community.github.io/lean4-metaprogramming-book/"⟩
    ]
    work := some (work "Project work")
  },
  {
    date := date "2026-12-02" "Dec 2"
    kind := .lecture 13
    title := "Agentic Lean proof generation I"
    application := some "Explore a generate–check–retry proof agent."
    work := some (work "Project work")
  },
  {
    date := date "2026-12-09" "Dec 9"
    kind := .lecture 14
    title := "Agentic Lean proof generation II"
    application := some "Run and evaluate an existing prover-training system."
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
