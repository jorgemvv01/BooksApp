import 'package:books_app/presentation/home/controller/home_controller.dart';
import 'package:books_app/presentation/home/widgets/book_card.dart';
import 'package:books_app/presentation/home/widgets/try_again.dart';
import 'package:books_app/presentation/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSlider extends StatelessWidget {
  BookSlider({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()
          => Visibility(
              visible: controller.booksList.isEmpty && !controller.isLoading.value,
              child: TryAgain()
            )
        ),
        Expanded(
          child: Obx(
            () => controller.isLoading.value && !controller.paginationCheck.value
            ? Center(
              child: CircularProgressIndicator(
                color: AppColors.secundary,
                backgroundColor: Colors.transparent,
              )
            )
            : ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.booksList.length,
              itemBuilder: (_, int index) 
                => BookCard(book: controller.booksList[index]),
            ),
          ),
        ),
        Obx(()
           => Visibility(
              visible: controller.isLoading.value && controller.paginationCheck.value,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secundary,
                    backgroundColor: Colors.transparent,
                  )
                )
              )
            )
        )
      ],
    );
  }
}