import 'package:dog_app/core/resources/app_colors.dart';
import 'package:dog_app/core/resources/app_values.dart';
import 'package:flutter/material.dart';

class LikeImagesBar extends StatelessWidget {
  const LikeImagesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: AppSize.s60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p20),
              child: Icon(
                Icons.favorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
