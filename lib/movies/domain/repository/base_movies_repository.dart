import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie_details.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendations>>> getMovieRecommendation(
      MovieRecommendationsParameters parameters);
}
