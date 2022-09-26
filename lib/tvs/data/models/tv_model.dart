import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.backdropPath,
    required super.id,
    required super.type,
    required super.voteAverage,
    required super.posterPath,
    required super.originalName,
    required super.overview,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.releaseDate,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
        backdropPath:
            json["backdrop_path"] ?? "/Aa9TLpNpBMyRkD8sPJ7ACKLjt0l.jpg",
        id: json["id"],
        type: json["type"] ?? "Not Defined",
        voteAverage: json["vote_average"].toDouble(),
        posterPath: json["poster_path"],
        originalName: json["original_name"],
        overview: json["overview"],
        numberOfEpisodes: json["number_of_episodes"] ?? 0,
        numberOfSeasons: json["number_of_seasons"] ?? 0,
        releaseDate: json["release_date"]??"12-10-2022");
  }
}