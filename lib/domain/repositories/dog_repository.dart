import '../../core/errors/server_failure.dart';
import '../models/dog_all_model.dart';
import 'package:dartz/dartz.dart';

abstract class AllDogDataRepository {
  Future<Either<Failure, List<DogAllBreedModel>>> getAllDogBreedData();
}
