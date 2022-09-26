import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';
import 'package:tvs_movies_app/tvs/domain/repository/base_tv_repository.dart';

class GetOnTheAirUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  BaseTvRepository baseTvRepository;

  GetOnTheAirUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getOnTheAirUseCase();
  }
}
