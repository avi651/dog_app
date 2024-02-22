import 'package:dog_app/domain/models/dog_all_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/dog_all_use_case.dart';
import 'all_dog_event.dart';
import 'all_dog_state.dart';

class DogAllBreedBloc extends Bloc<AllDogBreedEvent, DogAllBreedState> {
  final DogAllUseCase dogAllUseCase;

  DogAllBreedBloc({required this.dogAllUseCase}) : super(DogAllBreedInitial()) {
    on<FetchAllDogBreed>(
      (event, emit) async {
        emit(DogAllBreedLoading());
        final failureOrDogAllBreed = await dogAllUseCase();
        failureOrDogAllBreed.fold(
            (failure) => emit(DogAllBreedError(failure.toString())),
            (allDogBreed) => emit(DogAllBreedLoaded(allDogBreed)));
      },
    );
  }

  List<DogAllBreedModel> _placeholderData() {
    return List.generate(
      10,
      (index) => DogAllBreedModel(id: index, status: "Fake Name"),
    );
  }
}
