import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_recommmendation_usecase.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirUseCase();

  Future<Either<Failure, List<Tv>>> getPopularTvUseCase();

  Future<Either<Failure, List<Tv>>> getTopRatedTvUseCase();

  Future<Either<Failure, TvDetails>> getTvDetailsUseCase(
      TvDetailsParameters parameters);

  Future<Either<Failure, List<Recommendations>>> getTvRecommendationUseCase(
      TvRecommendationsParameters parameters);
}
