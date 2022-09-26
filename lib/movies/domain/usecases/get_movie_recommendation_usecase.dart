import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List<Recommendations>, MovieRecommendationsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      MovieRecommendationsParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationsParameters extends Equatable {
  final int id;

  const MovieRecommendationsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
