import 'dart:convert';
import 'package:books_app/domain/book/model/book.dart';

class BookResponse {
    BookResponse({
        required this.error,
        this.page,
        required this.total,
        required this.books,
    });

    String error;
    String? page;
    String total;
    List<Book> books;

    factory BookResponse.fromJson(String str) => BookResponse.fromMap(json.decode(str));

    factory BookResponse.fromMap(Map<String, dynamic> json) => BookResponse(
        error: json["error"],
        page: json["page"],
        total: json["total"],
        books: List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
    );

}
