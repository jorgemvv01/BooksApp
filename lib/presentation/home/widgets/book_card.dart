import 'package:books_app/domain/book/model/book.dart';
import 'package:books_app/presentation/details/view/book_details_page.dart';
import 'package:books_app/presentation/home/controller/home_controller.dart';
import 'package:books_app/presentation/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  Book book;
  BookCard({required this.book});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 1.8,
          shadowColor: Colors.grey,
          child: SizedBox(
            width: double.infinity,
            height: 160,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: 120,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        Text(book.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.secundary,
                            fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(book.subtitle.isEmpty ? 'No subtitle' : book.subtitle,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secundary
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: (){
                              Get.to(() => BookDetail(book: book,));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.secundary)
                            ), 
                            child: const Text(
                              'Detail',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}