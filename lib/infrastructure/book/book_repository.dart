import 'package:books_app/domain/book/interface/i_book.dart';
import 'package:books_app/domain/book/model/book_information.dart';
import 'package:books_app/domain/book/model/book_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class BookRepository extends IBook{
  
  final String _baseUrl = 'api.itbook.store';
  final String _apiVersion = '1.0';
  
  @override
  Future<BookResponse> getNewBooks() async {
    try{
      final url = Uri.https(_baseUrl, '$_apiVersion/new', {});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return BookResponse.fromJson(response.body);
      }
    }catch(e){
      Get.printError(info: 'An error has occurred: $e');
    }
    return BookResponse(error: '1', total: '', books: []);
  }

  @override
  Future<BookResponse> getBooks(String search, int pagination) async {
    try{
      final url = Uri.https(_baseUrl, '$_apiVersion/search/$search/$pagination', {});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return BookResponse.fromJson(response.body);
      }
    }catch(e){
      Get.printError(info: 'An error has occurred: $e');
    }
    return BookResponse(error: '1', total: '', books: []);
  }

  @override
  Future<BookInformation> getBookInformation(String isbn) async {
    try{
      final url = Uri.https(_baseUrl, '$_apiVersion/books/$isbn', {});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return BookInformation.fromJson(response.body);
      }
    }catch(e){
      Get.printError(info: 'An error has occurred: $e');
    }
    return BookInformation(error: '1');
  }

}