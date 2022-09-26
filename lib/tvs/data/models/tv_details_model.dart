import 'package:tvs_movies_app/core/shared/entities/generes.dart';
import 'package:tvs_movies_app/core/shared/models/geners_model.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel(
      {required super.backdropPath,
      required super.adult,
      required super.id,
      required super.type,
      required super.voteAverage,
      required super.posterPath,
      required super.originalName,
      required super.overview,
      required super.numberOfEpisodes,
      required super.numberOfSeasons,
      required super.genres});

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      backdropPath: json["backdrop_path"],
      adult: json["adult"],
      id: json["id"],
      type: json["type"],
      voteAverage: json["vote_average"],
      posterPath: json["poster_path"],
      originalName: json["original_name"],
      overview: json["overview"],
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      genres: List<Generes>.from(
        json["genres"].map((x) => GeneresModel.fromJson(x)),
      ),
    );
  }
}
