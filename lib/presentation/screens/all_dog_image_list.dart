import 'package:dog_app/core/resources/app_colors.dart';
import 'package:dog_app/core/resources/app_values.dart';
import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:dog_app/presentation/widgets/skleton_all_dog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/components/vertical_list_view.dart';
import '../../core/functions/image_to_base64.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_bloc.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_state.dart';
import '../bloc/all_dog_image_sqlite_bloc/all_dog_image_bloc.dart';
import '../bloc/all_dog_image_sqlite_bloc/all_dog_image_event.dart';
import '../widgets/all_dog_caching_img.dart';

class AllDogImageListView extends StatefulWidget {
  const AllDogImageListView({super.key});

  @override
  State<AllDogImageListView> createState() => _AllDogImageListViewState();
}

class _AllDogImageListViewState extends State<AllDogImageListView> {
  bool _showLikeButton = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2)).then((value) {
      setState(() {
        _showLikeButton = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogAllBreedImageBloc, DogAllBreedImageState>(
      builder: (context, state) {
        if (state is DogAllBreedImageInitial) {
          return const Center(
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
              return Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            state.allDogImageBreed[0].isSelected =
                                !state.allDogImageBreed[0].isSelected!;
                            String? imgBase64 = await const ImageBase64()
                                .networkImageToBase64(
                                    state.allDogImageBreed[0].message![index]);
                            if (!mounted) return;
                            context.read<AllDogImageBloc>().add(
                                  AddDataEvent(
                                    dogImgBase: imgBase64 ?? "",
                                  ),
                                );
                          },
                          child: AllDogCachingImg(img: img),
                        ),
                        _showLikeButton == false
                            ? LikeButton(
                                size: 80,
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.favorite,
                                    color: isLiked
                                        ? AppColors.redColor
                                        : Colors.transparent,
                                    size: 80,
                                  );
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              );
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
