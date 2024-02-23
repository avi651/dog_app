import '../../../domain/models/dog_all_model.dart';

abstract class DogAllBreedState {}

class DogAllBreedInitial extends DogAllBreedState {}

class DogAllBreedLoading extends DogAllBreedState {}

class DogAllBreedLoaded extends DogAllBreedState {
  final List<DogAllBreedModel> allDogBreed;

  DogAllBreedLoaded(this.allDogBreed);
}

class DogAllBreedError extends DogAllBreedState {
  final String message;

  DogAllBreedError(this.message);
}
