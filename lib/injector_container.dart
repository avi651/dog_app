import 'package:dog_app/presentation/bloc/all_dog_image_sqlite_bloc/all_dog_image_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/dog_remote_data_source.dart';
import 'data/datasources/remote/dog_remote_data_source_impl.dart';
import 'data/repositories/dog_repository_impl.dart';
import 'domain/repositories/dog_repository.dart';
import 'domain/usecases/dog_all_image_use_case.dart';
import 'domain/usecases/dog_all_use_case.dart';
import 'presentation/bloc/all_dog_bloc/all_dog_bloc.dart';
import 'presentation/bloc/all_dog_image_bloc/all_dog_image_bloc.dart';

final getIt = GetIt.instance;

void dependencyInjection() {
  // Bloc
  getIt.registerFactory(() => DogAllBreedBloc(dogAllUseCase: getIt()));
  getIt.registerFactory(() => DogAllBreedImageBloc(dogAllUseCase: getIt()));
  getIt.registerFactory(() => AllDogImageBloc());
  // Use cases
  getIt.registerLazySingleton(() => DogAllUseCase(getIt()));
  getIt.registerLazySingleton(() => SearchAllDogImageUseCase(getIt()));
  // Repositories
  getIt.registerLazySingleton<AllDogDataRepository>(
      () => DogRepositoryImpl(dogRemoteDataSource: getIt()));
  // Data sources
  getIt.registerLazySingleton<DogRemoteDataSource>(
      () => DogRemoteDataSourceImpl(client: getIt()));
  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
