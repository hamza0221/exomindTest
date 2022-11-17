import 'package:publicis_test/model/synopsis.dart';

class Book {
  String? isbn;
  String? title;
  String? img;
  String? auteur;
  int? price;
  String? cover;
  Synopsis? synopsis;

  Book(this.isbn, this.title, this.price, this.cover);

  Book.fromJson(Map<dynamic, dynamic> json) {
    isbn = json['isbn'] != null ? json["isbn"] : "";
    title = json['title'] != null ? json["title"] : "";
    price = json['price'] != null ? json["price"] : "";
    cover = json['cover'] != null ? json["cover"] : "";
    synopsis = Synopsis.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "price": price,
        "cover": cover,
        "synopsis": synopsis
      };
}
