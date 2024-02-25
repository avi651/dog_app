import 'package:dog_app/core/resources/app_colors.dart';
import 'package:dog_app/core/resources/app_values.dart';
import 'package:flutter/material.dart';

class LikeImagesBar extends StatefulWidget {
  const LikeImagesBar({super.key});

  @override
  State<LikeImagesBar> createState() => _LikeImagesBarState();
}

class _LikeImagesBarState extends State<LikeImagesBar> {
  bool? isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isImageSelected = !isImageSelected!;
        });
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: AppSize.s60,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: isImageSelected == true
                      ? const Icon(Icons.favorite)
                      : const Icon(
                          Icons.close,
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
