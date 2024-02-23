import 'package:dartz/dartz.dart';

import '../../core/errors/server_failure.dart';
import '../models/dog_breed_image_model.dart';
import '../repositories/dog_repository.dart';

class SearchAllDogImageUseCase {
  final AllDogDataRepository repository;

  SearchAllDogImageUseCase(this.repository);

  Future<Either<Failure, List<DogBreedImageModel>>> call(String query) async {
    return await repository.getAllDogBreedImageData(query);
  }
}
