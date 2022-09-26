import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg",
    );
  }
}
