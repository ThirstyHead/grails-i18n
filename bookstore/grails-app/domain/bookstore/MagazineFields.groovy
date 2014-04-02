package bookstore

class MagazineFields {
  String locale
  long parentId
  String description

  static constraints = {
    locale()
    parentId()
    description()
  }
}
