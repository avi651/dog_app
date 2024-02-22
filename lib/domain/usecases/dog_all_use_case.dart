import 'package:dartz/dartz.dart';
import '../../core/errors/server_failure.dart';
import '../models/dog_all_model.dart';
import '../repositories/dog_repository.dart';

class DogAllUseCase {
  final AllDogDataRepository allDogDataRepository;
  DogAllUseCase(this.allDogDataRepository);

  Future<Either<Failure, List<DogAllBreedModel>>> call() async {
    return await allDogDataRepository.getAllDogBreedData();
  }
}
