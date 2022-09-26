import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvRecommendationUseCase
    extends BaseUseCase<List<Recommendations>, TvRecommendationsParameters> {
  BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      TvRecommendationsParameters parameters) async {
    return await baseTvRepository.getTvRecommendationUseCase(parameters);
  }
}

class TvRecommendationsParameters extends Equatable {
  final int id;

  const TvRecommendationsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
