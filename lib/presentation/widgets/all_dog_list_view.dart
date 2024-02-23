import 'package:dog_app/core/components/vertical_list_view.dart';
import 'package:dog_app/presentation/widgets/all_dog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/dog_all_model.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_bloc.dart';
import '../bloc/all_dog_image_bloc/all_dog_image_event.dart';

class AllDogListView extends StatelessWidget {
  final List<DogAllBreedModel> dogAllBreedModel;
  const AllDogListView({super.key, required this.dogAllBreedModel});

  @override
  Widget build(BuildContext context) {
    return VerticalListView(
      itemCount: dogAllBreedModel[0].message!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<DogAllBreedImageBloc>().add(FetchllDogBreedImageEvent(
                dogAllBreedModel[0].message!.keys.elementAt(index)));
          },
          child: AllDogCard(message: dogAllBreedModel[0].message, index: index),
        );
      },
      addEvent: () {},
    );
  }
}
