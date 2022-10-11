import 'package:books_app/domain/book/model/book_information.dart';
import 'package:books_app/domain/book/model/book_response.dart';

abstract class IBook {
  Future<BookResponse> getNewBooks();
  Future<BookResponse> getBooks(String search, int pagination);
  Future<BookInformation> getBookInformation(String isbn);
}
