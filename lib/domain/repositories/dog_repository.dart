import '../../core/errors/server_failure.dart';
import '../models/dog_all_model.dart';
import 'package:dartz/dartz.dart';

import '../models/dog_breed_image_model.dart';

abstract class AllDogDataRepository {
  Future<Either<Failure, List<DogAllBreedModel>>> getAllDogBreedData();
  Future<Either<Failure, List<DogBreedImageModel>>> getAllDogBreedImageData(
      String dogImageData);
}
