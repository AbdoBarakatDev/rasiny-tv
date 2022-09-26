import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String backdropPath;
  final int id;
  final String type;
  final double voteAverage;
  final String posterPath;
  final String originalName;
  final String overview;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String releaseDate;

  const Tv({
    required this.backdropPath,
    required this.id,
    required this.type,
    required this.voteAverage,
    required this.posterPath,
    required this.originalName,
    required this.overview,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        type,
        voteAverage,
        posterPath,
        originalName,
        overview,
        numberOfEpisodes,
        numberOfSeasons,
        releaseDate
      ];
}
