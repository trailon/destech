class BookList {
  String? status;
  int? code;
  int? total;
  List<Book>? data;

  BookList({this.status, this.code, this.total, this.data});

  BookList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Book>[];
      json['data'].forEach((v) {
        data!.add(Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  int? id;
  String? title;
  String? author;
  String? genre;
  String? description;
  String? isbn;
  String? image;
  String? published;
  String? publisher;

  Book(
      {this.id,
      this.title,
      this.author,
      this.genre,
      this.description,
      this.isbn,
      this.image,
      this.published,
      this.publisher});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    genre = json['genre'];
    description = json['description'];
    isbn = json['isbn'];
    image = json['image'];
    published = json['published'];
    publisher = json['publisher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['genre'] = genre;
    data['description'] = description;
    data['isbn'] = isbn;
    data['image'] = image;
    data['published'] = published;
    data['publisher'] = publisher;
    return data;
  }
}
