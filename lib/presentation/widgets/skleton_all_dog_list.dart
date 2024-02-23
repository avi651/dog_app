import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:flutter/material.dart';

class SkletonAllDogList extends StatelessWidget {
  const SkletonAllDogList({super.key, required this.dogAllBreedModel});

  final DogAllBreedModel dogAllBreedModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: dogAllBreedModel.message?.length,
      itemBuilder: (context, index) {
        return const Card(
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        );
      },
    );
  }
}
