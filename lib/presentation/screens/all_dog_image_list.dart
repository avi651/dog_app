import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/core/resources/app_colors.dart';
import 'package:dog_app/core/resources/app_values.dart';
import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:dog_app/presentation/widgets/skleton_all_dog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/components/vertical_list_view.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_bloc.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_state.dart';

class AllDogImageListView extends StatelessWidget {
  const AllDogImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogAllBreedImageBloc, DogAllBreedImageState>(
      builder: (context, state) {
        if (state is DogAllBreedImageInitial) {
          return Center(
            child: Text("No Image"),
          );
        }
        if (state is DogAllBreedImageLoading) {
          return Skeletonizer(
            child: SkletonAllDogList(
              dogAllBreedModel: DogAllBreedModel(),
            ),
          );
        } else if (state is DogAllBreedImageLoaded) {
          return VerticalListView(
            itemCount: state.allDogImageBreed[0].message!.length,
            itemBuilder: (context, index) {
              var img = state.allDogImageBreed[0].message![index];
              print("The Image is-> $img");
              return Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
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
                        color: Colors.red,
                      ),
                    ),
                    /*child: Text(
                      state.allDogImageBreed[0].message![index],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),*/
                  ),
                ),
              );
              /*return SizedBox(
                width: 20,
                child: Text(state.allDogImageBreed[0].message![index]),
              );*/
            },
            addEvent: () {},
          );
        } else if (state is DogAllBreedImageError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
