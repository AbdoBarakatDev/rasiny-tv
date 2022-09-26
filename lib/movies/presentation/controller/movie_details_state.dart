import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie_details.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final RequestStates movieDetailsStates;
  final List<Recommendations> recommendations;
  final String recommendationsMessage;
  final RequestStates recommendationsStates;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsMessage = "",
      this.movieDetailsStates = RequestStates.loading,
      this.recommendations = const [],
      this.recommendationsMessage = "",
      this.recommendationsStates = RequestStates.loading});

  MovieDetailsState copyWith({
    final MovieDetails? movieDetails,
    final String? movieDetailsMessage,
    final RequestStates? movieDetailsStates,
    final List<Recommendations>? recommendations,
    final String? recommendationsMessage,
    final RequestStates? recommendationsStates,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsStates: movieDetailsStates ?? this.movieDetailsStates,
      recommendations: recommendations ?? this.recommendations,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
      recommendationsStates:
          recommendationsStates ?? this.recommendationsStates,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        movieDetailsStates,
        recommendations,
        recommendationsStates,
        recommendationsMessage
      ];
}
