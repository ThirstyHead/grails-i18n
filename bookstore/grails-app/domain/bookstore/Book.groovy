package bookstore

class Book {
  String title
  String author
  Integer pages

  static constraints = {
    title()
    author()
    pages(min:0)
  }
}
