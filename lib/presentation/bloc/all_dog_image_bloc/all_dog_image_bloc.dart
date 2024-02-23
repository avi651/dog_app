import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/dog_all_image_use_case.dart';
import 'all_dog_image_event.dart';
import 'all_dog_image_state.dart';

class DogAllBreedImageBloc
    extends Bloc<AllDogImageBreedEvent, DogAllBreedImageState> {
  final SearchAllDogImageUseCase dogAllUseCase;

  DogAllBreedImageBloc({required this.dogAllUseCase})
      : super(DogAllBreedImageInitial()) {
    on<FetchllDogBreedImageEvent>((event, emit) async {
      emit(DogAllBreedImageLoading());
      final failureOrAllBreedImageList = await dogAllUseCase(event.query);
      failureOrAllBreedImageList.fold(
          (failure) => emit(DogAllBreedImageError(failure.toString())),
          (allDogImage) => emit(DogAllBreedImageLoaded(allDogImage)));
    });
  }
}
