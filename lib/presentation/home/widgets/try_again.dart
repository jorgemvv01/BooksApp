import 'package:books_app/presentation/home/controller/home_controller.dart';
import 'package:books_app/presentation/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TryAgain extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: AppColors.secundary,
            size: 50,
          ),
          const SizedBox(height: 10,),
          Text(
            'Oops.. No books found', 
            style: TextStyle(
              fontSize: 18,
              color: AppColors.secundary
            )
          ),
          TextButton(
            onPressed: (){
              controller.resetVariables();
              controller.searchText.isEmpty
              ? controller.getNewBooks()
              : controller.getBooks();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.secundary)
            ), 
            child: const Text(
              'Try again', 
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              )
            ),
          ),
        ],
      ),
    );
  }
}