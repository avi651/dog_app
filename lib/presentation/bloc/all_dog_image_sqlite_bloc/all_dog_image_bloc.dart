import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../data/datasources/database/database_helper.dart';
import '../../../domain/models/db_dog_img_model.dart';
import 'all_dog_image_event.dart';
import 'all_dog_image_state.dart';

class AllDogImageBloc extends Bloc<AllDogImageEvent, AllDogImageState> {
  AllDogImageBloc() : super(const AllDogImageState(dbDogImageModel: [])) {
    on<ShowDataEvent>(showData);
    on<AddDataEvent>(_addData);
  }

  Future showData(ShowDataEvent event, Emitter<AllDogImageState> emit) async {
    final dataList = await DBHelper.selectAll(DBHelper.allDogTable);

    final list = dataList
        .map((item) => DBDogImageModel(
              id: item['id'],
              dogImgBase: item['dogImgBase'],
            ))
        .toList();

    emit(state.copyWith(dbDogImageModel: list));
    print('SHOW DATA ${list.length}');
  }

  Future<void> _addData(
      AddDataEvent event, Emitter<AllDogImageState> emit) async {
    Uuid uuid = const Uuid();
    final list = DBDogImageModel(
      id: uuid.v1(),
      dogImgBase: event.dogImgBase,
    );
    DBHelper.insert(DBHelper.allDogTable, {
      'id': list.id,
      'dogImgBase': list.dogImgBase,
    });

    final allDogImageData = [...state.dbDogImageModel, list];
    emit(state.copyWith(dbDogImageModel: allDogImageData));
  }
}
