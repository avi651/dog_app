import 'package:dog_app/presentation/screens/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(12);
    final double _bHeight = 24;
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(12.0), //outside the card
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(8), // inner padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* top large two
              ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  height: _bHeight,
                  width: constraints.maxWidth,
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  height: _bHeight * .75,
                  width: constraints.maxWidth,
                ),
              ),
              const SizedBox(height: 8),
              //3rd row
              ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  height: _bHeight * .75,
                  width: constraints.maxWidth * 0.6,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: _border,
                    child: ShimmerWidget.rectangular(
                      height: _bHeight,
                      width: constraints.maxWidth * 0.4,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: _border,
                    child: ShimmerWidget.rectangular(
                      height: _bHeight,
                      width: constraints.maxWidth * 0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
