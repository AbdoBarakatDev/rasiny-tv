import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/exceptions.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie_details.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getMovieRecommendation(
      MovieRecommendationsParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
