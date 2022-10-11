import 'package:books_app/presentation/home/controller/home_controller.dart';
import 'package:books_app/presentation/home/widgets/book_slider.dart';
import 'package:books_app/presentation/home/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Books App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context, 
              delegate: BookSearchDelegate()
            ) 
          )
        ],
      ),
      body: BookSlider(),
    );
  }
}