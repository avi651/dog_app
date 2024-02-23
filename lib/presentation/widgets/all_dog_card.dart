import 'package:dog_app/core/resources/app_values.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';

class AllDogCard extends StatelessWidget {
  final Map<String, List<String>>? message;
  final int index;
  const AllDogCard({super.key, required this.message, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: AppSize.s60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Text(
            message!.keys.elementAt(index),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
