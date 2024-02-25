import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllDogCachingImg extends StatelessWidget {
  final String img;

  const AllDogCachingImg({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      fit: BoxFit.contain,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.black26,
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: AppColors.redColor,
      ),
    );
  }
}
