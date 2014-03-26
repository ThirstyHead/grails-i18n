package bookstore

// NOTE: currently broken in 0.8.1
//@i18nfields.I18nFields
class Book {
  String title
  String author
  Integer pages

  static i18nFields=["title"]

  static constraints = {
    title()
    author()
    pages(min:0)
  }
}
