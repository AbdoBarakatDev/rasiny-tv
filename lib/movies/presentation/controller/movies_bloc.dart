import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movies_event.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getPopularMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      // print("result in getNowPlayingMoviesUseCase: $result");
      return result.fold((l) {
        emit(state.copyWith(
          nowPlayingMoviesStates: RequestStates.error,
          nowPlayingMoviesMessage: l.message,
        ));
      }, (r) {
        emit(state.copyWith(
          nowPlayingMoviesStates: RequestStates.loaded,
          nowPlayingMovies: r,
        ));
      });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());
      // print("result in getPopularMoviesUseCase: $result");
      return result.fold((l) {
        emit(state.copyWith(
            mostPopularMoviesMessage: l.message,
            mostPopularMoviesStates: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
          mostPopularMovies: r,
          mostPopularMoviesStates: RequestStates.loaded,
        ));
      });
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameters());
      // print("result in getTopRatedMoviesUseCase: $result");
      return result.fold((l) {
        emit(state.copyWith(
            topRatedMoviesMessage: l.message,
            topRatedMoviesStates: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
          topRatedMovies: r,
          topRatedMoviesStates: RequestStates.loaded,
        ));
      });
    });
  }
}
