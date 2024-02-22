import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:dog_app/presentation/screens/shimmer_item.dart';
import 'package:dog_app/presentation/screens/userlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../bloc/all_dog_bloc/all_dog_bloc.dart';
import '../bloc/all_dog_bloc/all_dog_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DogAllBreedBloc, DogAllBreedState>(
        builder: (context, state) {
          if (state is DogAllBreedInitial) {
            return ShimmerItem();
          }
          if (state is DogAllBreedLoading) {
            return ShimmerItem();
          } else if (state is DogAllBreedLoaded) {
            return ShimmerItem();
            //return Text(
            //    state.allDogBreed.elementAt(0).message!.keys.elementAt(10));
          } else if (state is DogAllBreedError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
