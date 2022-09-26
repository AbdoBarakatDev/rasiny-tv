import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/shared/entities/generes.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final bool adult;
  final int id;
  final String type;
  final double voteAverage;
  final String posterPath;
  final String originalName;
  final String overview;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<Generes> genres;

  const TvDetails(
      {required this.backdropPath,
      required this.adult,
      required this.id,
      required this.type,
      required this.voteAverage,
      required this.posterPath,
      required this.originalName,
      required this.overview,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.genres});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        adult,
        id,
        type,
        voteAverage,
        posterPath,
        originalName,
        overview,
        numberOfEpisodes,
        numberOfSeasons,
        genres,
      ];
}
