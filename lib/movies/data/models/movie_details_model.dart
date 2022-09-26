import 'package:tvs_movies_app/core/shared/models/geners_model.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backDroPath,
      required super.title,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage,
      required super.overview,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      backDroPath: json["backdrop_path"] ?? "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg",
      title: json["title"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
      voteAverage: json["vote_average"].toDouble(),
      overview: json["overview"],
      genres: List<GeneresModel>.from(
          json["genres"].map((x) => GeneresModel.fromJson(x))),
    );
  }
}
