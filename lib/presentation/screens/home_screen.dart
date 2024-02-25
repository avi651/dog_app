import 'package:dog_app/domain/models/dog_all_model.dart';

import 'package:dog_app/presentation/widgets/skleton_all_dog_list.dart';
import 'package:dog_app/presentation/widgets/all_dog_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/components/base_app_bar.dart';
import '../../core/components/like_images_bar.dart';
import '../bloc/all_dog_bloc/all_dog_bloc.dart';
import '../bloc/all_dog_bloc/all_dog_state.dart';
import 'all_dog_image_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('Dog App'),
        appBar: AppBar(),
      ),
      body: BlocBuilder<DogAllBreedBloc, DogAllBreedState>(
        builder: (context, state) {
          if (state is DogAllBreedInitial) {
            return Skeletonizer(
              child: SkletonAllDogList(
                dogAllBreedModel: DogAllBreedModel(),
              ),
            );
          }
          if (state is DogAllBreedLoading) {
            return Skeletonizer(
              child: SkletonAllDogList(
                dogAllBreedModel: DogAllBreedModel(),
              ),
            );
          } else if (state is DogAllBreedLoaded) {
            return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: double.infinity,
                  child: AllDogListView(dogAllBreedModel: state.allDogBreed),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1 - 2,
                        child: const LikeImagesBar(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: const AllDogImageListView(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is DogAllBreedError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
