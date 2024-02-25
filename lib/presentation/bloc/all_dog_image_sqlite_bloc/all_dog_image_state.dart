import 'package:equatable/equatable.dart';

import '../../../domain/models/db_dog_img_model.dart';

class AllDogImageState extends Equatable {
  final List<DBDogImageModel> dbDogImageModel;

  const AllDogImageState({required this.dbDogImageModel});

  @override
  List<Object?> get props => [dbDogImageModel];

  AllDogImageState copyWith({required List<DBDogImageModel> dbDogImageModel}) {
    return AllDogImageState(dbDogImageModel: dbDogImageModel);
  }
}
