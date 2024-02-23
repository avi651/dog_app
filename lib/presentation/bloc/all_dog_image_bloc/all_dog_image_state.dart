import '../../../domain/models/dog_breed_image_model.dart';

abstract class DogAllBreedImageState {}

class DogAllBreedImageInitial extends DogAllBreedImageState {}

class DogAllBreedImageLoading extends DogAllBreedImageState {}

class DogAllBreedImageLoaded extends DogAllBreedImageState {
  final List<DogBreedImageModel> allDogImageBreed;

  DogAllBreedImageLoaded(this.allDogImageBreed);
}

class DogAllBreedImageEmpty extends DogAllBreedImageState {}

class DogAllBreedImageError extends DogAllBreedImageState {
  final String message;

  DogAllBreedImageError(this.message);
}
