import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String originalTitle;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        genreIds,
        originalTitle,
        title,
        overview,
        voteAverage,
        releaseDate
      ];
}
