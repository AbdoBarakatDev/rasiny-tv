import 'package:get_it/get_it.dart';
import 'package:tvs_movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:tvs_movies_app/movies/data/repository/movies_repository.dart';
import 'package:tvs_movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:tvs_movies_app/tvs/data/datasource/tv_remote_datasource.dart';
import 'package:tvs_movies_app/tvs/data/repository/tv_repository.dart';
import 'package:tvs_movies_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_on_the_air_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_popular_tv_usscase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_top_rated_tv_usecas.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_recommmendation_usecase.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_bloc.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static init() {
    /// Bloc
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(
          sl(),
          sl(),
        ));

    sl.registerFactory<TvBloc>(() => TvBloc(sl(), sl(), sl()));

    sl.registerFactory<TvDetailsBloc>(() => TvDetailsBloc(
          sl(),
          sl(),
        ));

    /// Use Cases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));

    sl.registerLazySingleton<GetMovieRecommendationUseCase>(
        () => GetMovieRecommendationUseCase(sl()));

//=====
    sl.registerLazySingleton<GetOnTheAirUseCase>(
        () => GetOnTheAirUseCase(sl()));
    sl.registerLazySingleton<GetPopularTvUseCase>(
        () => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedTvUseCase>(
        () => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton<GetTvDetailsUseCase>(
        () => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton<GetTvRecommendationUseCase>(
        () => GetTvRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());
  }
}
