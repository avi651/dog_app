import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/server_failure.dart';

import 'package:dog_app/domain/models/dog_all_model.dart';

import '../../domain/repositories/dog_repository.dart';
import '../datasources/dog_remote_data_source.dart';

class DogRepositoryImpl implements AllDogDataRepository {
  final DogRemoteDataSource dogRemoteDataSource;
  DogRepositoryImpl({required this.dogRemoteDataSource});

  @override
  Future<Either<Failure, List<DogAllBreedModel>>> getAllDogBreedData() async {
    try {
      final result = await dogRemoteDataSource.getAllDogBreedData();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
