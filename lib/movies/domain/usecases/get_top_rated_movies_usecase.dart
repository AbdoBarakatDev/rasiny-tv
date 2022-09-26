import 'package:dartz/dartz.dart';
import 'package:tvs_movies_app/core/error/failure.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie.dart';
import 'package:tvs_movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
