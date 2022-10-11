

import 'package:books_app/domain/book/model/book.dart';
import 'package:books_app/presentation/details/controller/book_details_controller.dart';
import 'package:books_app/presentation/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetail extends StatelessWidget {

  final Book book;
  BookDetail({
    required this.book
  });

  final BookDetailsController controller = Get.put(BookDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(book.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppColors.secundary
                  ),
                  const SizedBox(height: 10),
                  for (String key in book.toMap().keys)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${capitalize(key)}:',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.secundary,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          book.toMap()[key],
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secundary,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Obx(
                    () => controller.bookInformation.isEmpty
                    ? Center(
                      child: TextButton(
                          onPressed: (){
                            controller.getBookInformation(book.isbn13);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.secundary)
                          ), 
                          child: Text(
                            controller.textButton.value, 
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (String key in controller.bookInformation[0].toMap().keys)
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${capitalize(key)}:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.secundary,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  controller.bookInformation[0].toMap()[key] ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.secundary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                      ],
                    )
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}