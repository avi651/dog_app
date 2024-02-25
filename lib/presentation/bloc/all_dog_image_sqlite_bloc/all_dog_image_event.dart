import 'package:equatable/equatable.dart';

abstract class AllDogImageEvent extends Equatable {
  const AllDogImageEvent();
}

class ShowDataEvent extends AllDogImageEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddDataEvent extends AllDogImageEvent {
  final String dogImgBase;

  const AddDataEvent({
    required this.dogImgBase,
  });

  @override
  List<Object> get props => [dogImgBase];

  AddDataEvent copyWith({
    String? dogImgBase,
  }) {
    return AddDataEvent(
      dogImgBase: dogImgBase ?? this.dogImgBase,
    );
  }
}
