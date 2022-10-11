import 'package:books_app/domain/book/interface/i_book.dart';
import 'package:books_app/domain/book/model/book_information.dart';
import 'package:books_app/domain/book/model/book_response.dart';

class BookService {
  final IBook iBook;
  BookService(this.iBook);

  Future<BookResponse> getNewBooks(){
    return iBook.getNewBooks();
  }

  Future<BookResponse> getBooks(String search, int pagination){
    return iBook.getBooks(search, pagination);
  }

  Future<BookInformation> getBookInformation(String isbn){
    return iBook.getBookInformation(isbn);
  }
}