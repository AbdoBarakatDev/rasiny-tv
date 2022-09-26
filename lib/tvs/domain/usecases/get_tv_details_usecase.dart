import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_movies_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, TvDetailsParameters> {
  BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(
      TvDetailsParameters parameters) async {
    return await baseTvRepository.getTvDetailsUseCase(parameters);
  }
}

class TvDetailsParameters extends Equatable {
  final int id;

  const TvDetailsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
