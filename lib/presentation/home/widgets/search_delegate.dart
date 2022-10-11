

import 'package:books_app/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSearchDelegate extends SearchDelegate{

  HomeController controller = Get.find();

  @override
  String get searchFieldLabel => 'Search book';


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        }
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
    controller.searchText.value = query;
    controller.resetVariables();
    query.isNotEmpty
      ? controller.getBooks() 
      : controller.getNewBooks(); 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: controller.lastSearch.length,
      itemBuilder: (_, int index) => ListTile(
        title: Text(controller.lastSearch[index]),
        leading: const Icon(Icons.youtube_searched_for_sharp),
        onTap: (){
          close(context, null);
          query = controller.lastSearch[index];
          controller.searchText.value = query;
          controller.resetVariables();
          if(query.isNotEmpty) controller.getBooks();
        },
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}