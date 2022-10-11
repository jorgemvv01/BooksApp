import 'dart:convert';

class Book {
    Book({
        required this.title,
        required this.subtitle,
        required this.isbn13,
        required this.price,
        required this.image,
        required this.url,
    });

    String title;
    String subtitle;
    String isbn13;
    String price;
    String image;
    String url;

    factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

    factory Book.fromMap(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
    );
    
    Map<String, dynamic> toMap() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
    };

}