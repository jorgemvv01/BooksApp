import 'package:books_app/domain/book/model/book_information.dart';
import 'package:books_app/domain/book/service/book_service.dart';
import 'package:books_app/infrastructure/book/book_repository.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController{

  RxList<BookInformation> bookInformation = <BookInformation>[].obs;
  RxString textButton = 'See more information'.obs;
  final BookService bookService = BookService(BookRepository());
  
  Future<void> getBookInformation(String isbn) async {
    textButton.value = 'Loading...';
    BookInformation response = await bookService.getBookInformation(isbn);
    if(response.error == '0') bookInformation.value = [response];
    textButton.value = 'See more information';
  }
}