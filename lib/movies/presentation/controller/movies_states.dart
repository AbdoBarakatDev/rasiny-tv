import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingMoviesStates;
  final String nowPlayingMoviesMessage;

  final List<Movie> topRatedMovies;
  final RequestStates topRatedMoviesStates;
  final String topRatedMoviesMessage;

  final List<Movie> popularMovies;
  final RequestStates popularMoviesStates;
  final String popularMoviesMessage;

  const MoviesStates({
    this.topRatedMovies = const [],
    this.popularMovies = const [],
    this.topRatedMoviesStates = RequestStates.loading,
    this.popularMoviesStates = RequestStates.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesStates = RequestStates.loading,
    this.nowPlayingMoviesMessage = "",
    this.topRatedMoviesMessage = "",
    this.popularMoviesMessage = "",
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStates? nowPlayingMoviesStates,
    String? nowPlayingMoviesMessage,
    List<Movie>? topRatedMovies,
    RequestStates? topRatedMoviesStates,
    String? topRatedMoviesMessage,
    List<Movie>? mostPopularMovies,
    RequestStates? mostPopularMoviesStates,
    String? mostPopularMoviesMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesStates:
          nowPlayingMoviesStates ?? this.nowPlayingMoviesStates,
      nowPlayingMoviesMessage:
          nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      popularMovies: mostPopularMovies ?? this.popularMovies,
      popularMoviesStates: mostPopularMoviesStates ?? this.popularMoviesStates,
      popularMoviesMessage:
          mostPopularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesStates: topRatedMoviesStates ?? this.topRatedMoviesStates,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesStates,
        nowPlayingMoviesMessage,
        topRatedMoviesMessage,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesStates,
        popularMovies,
        popularMoviesStates,
      ];
}
