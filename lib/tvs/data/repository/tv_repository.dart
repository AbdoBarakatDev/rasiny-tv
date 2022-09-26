import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/exceptions.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/tvs/data/datasource/tv_remote_datasource.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_movies_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_recommmendation_usecase.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTVRemoteDataSource;

  TvRepository(this.baseTVRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirUseCase() async {
    final result = await baseTVRemoteDataSource.getOnTheAirUseCase();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetailsUseCase(
      TvDetailsParameters parameters) async {
    final result = await baseTVRemoteDataSource.getTvDetailsUseCase(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvUseCase() async {
    final result = await baseTVRemoteDataSource.getPopularTvUseCase();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvUseCase() async {
    final result = await baseTVRemoteDataSource.getTopRatedTvUseCase();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getTvRecommendationUseCase(
      TvRecommendationsParameters parameters) async {
    final result =
        await baseTVRemoteDataSource.getTvRecommendationUseCase(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
