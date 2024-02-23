import '../../domain/models/dog_all_model.dart';
import '../../domain/models/dog_breed_image_model.dart';

abstract class DogRemoteDataSource {
  Future<List<DogAllBreedModel>> getAllDogBreedData();
  Future<List<DogBreedImageModel>> getAllDogBreedImageData(String dogImageName);
}
