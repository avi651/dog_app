import 'package:equatable/equatable.dart';

class DBDogImageModel extends Equatable {
  final String dogImgBase;
  final String id;

  const DBDogImageModel({
    required this.dogImgBase,
    required this.id,
  });

  DBDogImageModel copyWith({
    String? dogImgBase,
    String? id,
  }) {
    return DBDogImageModel(
      dogImgBase: dogImgBase ?? this.dogImgBase,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [dogImgBase, id];
}
