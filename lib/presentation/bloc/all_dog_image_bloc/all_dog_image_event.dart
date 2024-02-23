abstract class AllDogImageBreedEvent {}

class FetchllDogBreedImageEvent extends AllDogImageBreedEvent {
  final String query;

  FetchllDogBreedImageEvent(this.query);
}
