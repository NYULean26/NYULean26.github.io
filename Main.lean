import Course
import VersoBlog

/-! Executable entry point for the Verso site generator. -/

def main :=
  Verso.Genre.Blog.blogMain Course.theme Course.courseSite
