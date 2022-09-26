import 'package:tvs_movies_app/core/shared/entities/generes.dart';

class GeneresModel extends Generes {
  const GeneresModel({required super.id, required super.name});

  factory GeneresModel.fromJson(Map<String, dynamic> json) {
    return GeneresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
