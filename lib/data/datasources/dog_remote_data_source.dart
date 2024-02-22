import 'package:dog_app/domain/models/dog_all_model.dart';

abstract class DogRemoteDataSource {
  Future<List<DogAllBreedModel>> getAllDogBreedData();
}
