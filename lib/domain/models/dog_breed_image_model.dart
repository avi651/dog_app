import 'dart:convert';

DogBreedImageModel dogBreedImageModelFromJson(String str) =>
    DogBreedImageModel.fromJson(json.decode(str));

String dogBreedImageModelToJson(DogBreedImageModel data) =>
    json.encode(data.toJson());

class DogBreedImageModel {
  final List<String>? message;
  final String? status;
  bool? isSelected = false;

  DogBreedImageModel({
    this.message,
    this.status,
    this.isSelected,
  });

  DogBreedImageModel copyWith({
    List<String>? message,
    String? status,
    bool? isSelected,
  }) =>
      DogBreedImageModel(
        message: message ?? this.message,
        status: status ?? this.status,
        isSelected: isSelected ?? this.isSelected,
      );

  factory DogBreedImageModel.fromJson(Map<String, dynamic> json) =>
      DogBreedImageModel(
        message: json["message"] == null
            ? []
            : List<String>.from(json["message"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "status": status,
      };
}
