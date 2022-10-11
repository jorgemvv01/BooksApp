import 'package:books_app/domain/book/model/book.dart';
import 'package:books_app/domain/book/model/book_response.dart';
import 'package:books_app/domain/book/service/book_service.dart';
import 'package:books_app/infrastructure/book/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  RxList<Book> booksList = <Book>[].obs;
  RxList<String> lastSearch = <String>[].obs;
  ScrollController scrollController = ScrollController();
  RxString searchText = ''.obs;
  RxBool isLoading = true.obs;
  RxBool paginationCheck = false.obs;
  int pagination = 1;
  static late SharedPreferences _pref;
  final BookService bookService = BookService(BookRepository());


  @override
  Future<void> onInit() async {

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 400
      && scrollController.positions.any((pos) => pos.userScrollDirection == ScrollDirection.reverse)){
        if(searchText.value.isNotEmpty){
          getBooks();
        }
      }
    });

    _pref = await SharedPreferences.getInstance();
    lastSearch.value = _pref.getStringList('lastSearch') ?? [];
    getNewBooks();
    super.onInit();
  }
  
  Future<void> getNewBooks() async{
    isLoading.value = true;
    BookResponse bookResponse = await bookService.getNewBooks();
    if(bookResponse.error == '0') booksList.value = [...bookResponse.books.getRange(0,10)];
    isLoading.value = false;
  }

  Future<void> getBooks() async{
    if(isLoading.value) return;
    isLoading.value = true;
    if(pagination != 1) paginationCheck.value = true;
    BookResponse bookResponse = await bookService.getBooks(searchText.value,pagination);
    if(bookResponse.error == '0') booksList.value = [...booksList, ...bookResponse.books];
    saveLastSearch();
    pagination++;
    isLoading.value = false;
  }

  void resetVariables(){
    booksList.value = [];
    pagination = 1;
    paginationCheck.value = false;
  }

  void saveLastSearch(){
    if(!lastSearch.contains(searchText.value)) lastSearch.insert(0, searchText.value);
    if(lastSearch.length > 5){
      lastSearch.removeLast();
    }
    _pref.setStringList('lastSearch', lastSearch);
  }
}