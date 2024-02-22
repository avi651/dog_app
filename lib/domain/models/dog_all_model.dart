import 'dart:convert';

DogAllBreedModel dogAllBreadModelFromJson(String str) =>
    DogAllBreedModel.fromJson(json.decode(str));

String dogAllBreadModelToJson(DogAllBreedModel data) =>
    json.encode(data.toJson());

class DogAllBreedModel {
  final Map<String, List<String>>? message;
  final String? status;

  DogAllBreedModel({
    this.message,
    this.status,
  });

  DogAllBreedModel copyWith({
    Map<String, List<String>>? message,
    String? status,
  }) =>
      DogAllBreedModel(
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory DogAllBreedModel.fromJson(Map<String, dynamic> json) =>
      DogAllBreedModel(
        message: Map.from(json["message"]!).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(message!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}
