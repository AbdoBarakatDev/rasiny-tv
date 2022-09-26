import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tvs_movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movie_details_event.dart';
import 'package:tvs_movies_app/movies/presentation/controller/movie_details_state.dart';
import 'package:tvs_movies_app/utils/enums.dart';

import 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getMovieRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));
    result.fold((l) {
      emit(state.copyWith(
        movieDetailsStates: RequestStates.error,
        movieDetailsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        movieDetailsStates: RequestStates.loaded,
        movieDetails: r,
      ));
    });
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationUseCase(
        MovieRecommendationsParameters(id: event.id));
    result.fold((l) {
      emit(state.copyWith(
        recommendationsStates: RequestStates.error,
        recommendationsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        recommendationsStates: RequestStates.loaded,
        recommendations: r,
      ));
    });
  }
}
