import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.dogAllBreedModel});

  final DogAllBreedModel dogAllBreedModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: dogAllBreedModel.message?.length,
      itemBuilder: (context, index) {
        return const Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text("Hello"),
            ),
            title: Text("Hello"),
            subtitle: Text("Hello"),
          ),
        );
      },
    );
  }
}
