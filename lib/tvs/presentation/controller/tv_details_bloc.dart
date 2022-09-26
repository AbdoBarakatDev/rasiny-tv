import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_recommmendation_usecase.dart';
import 'package:tvs_movies_app/utils/enums.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsStates> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommendationUseCase getTvRecommendationUseCase;

  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvRecommendationUseCase)
      : super(const TvDetailsStates()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getTvRecommendations);
  }

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsStates> emit) async {
    final result = await getTvDetailsUseCase(TvDetailsParameters(id: event.id));
    return result.fold((l) {
      emit(state.copyWith(
          tvDetailsMessage: l.message, tvDetailsState: RequestStates.error));
    }, (r) {
      emit(state.copyWith(tvDetails: r, tvDetailsState: RequestStates.loaded));
    });
  }

  FutureOr<void> _getTvRecommendations(
      GetTvRecommendationEvent event, Emitter<TvDetailsStates> emit) async {
    final result = await getTvRecommendationUseCase(
        TvRecommendationsParameters(id: event.id));
    return result.fold((l) {
      emit(state.copyWith(
          tvRecommendationsMessage: l.message,
          tvRecommendationsState: RequestStates.error));
    }, (r) {
      emit(state.copyWith(
          tvRecommendations: r, tvRecommendationsState: RequestStates.loaded));
    });
  }
}
