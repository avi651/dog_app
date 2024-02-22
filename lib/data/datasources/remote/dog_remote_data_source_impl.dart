import 'dart:convert';
import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';
import '../../../core/errors/server_exception.dart';
import '../dog_remote_data_source.dart';

class DogRemoteDataSourceImpl implements DogRemoteDataSource {
  final http.Client client;

  DogRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DogAllBreedModel>> getAllDogBreedData() async {
    final response = await client.get(
      Uri.parse("https://dog.ceo/api/breeds/list/all"),
    );

    if (response.statusCode == 200) {
      final convertDataToJson = json.decode("[${response.body}]");
      return List<DogAllBreedModel>.from(
          (convertDataToJson as List).map((e) => DogAllBreedModel.fromJson(e)));
    } else {
      throw ServerException();
    }
  }
}
