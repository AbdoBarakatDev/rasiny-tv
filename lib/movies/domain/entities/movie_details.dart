import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/shared/entities/generes.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backDroPath;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final String overview;
  final int runtime;
  final List<Generes> genres;

  const MovieDetails({
    required this.id,
    required this.backDroPath,
    required this.title,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.overview,
    required this.genres,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        backDroPath,
        title,
        releaseDate,
        voteAverage,
        overview,
        genres,
        runtime,
      ];
}
