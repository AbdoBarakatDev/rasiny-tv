import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_movies_app/core/usecases/base_usecases.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_on_the_air_usecase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_popular_tv_usscase.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_top_rated_tv_usecas.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_event.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_state.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class TvBloc extends Bloc<TvEvent, TvsStates> {
  final GetOnTheAirUseCase getOnTheAirUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;

  TvBloc(this.getOnTheAirUseCase, this.getPopularTvUseCase,
      this.getTopRatedTvUseCase)
      : super(const TvsStates()) {
    on<GetOnTheAirTvEvent>(
      (event, emit) async {
        final result = await getOnTheAirUseCase(const NoParameters());
        return result.fold((l) {
          emit(state.copyWith(
            onTheAirTvsMessage: l.message,
            onTheAirTvsStates: RequestStates.error,
          ));
        }, (r) {
          emit(state.copyWith(
              onTheAirTvs: r, onTheAirTvsStates: RequestStates.loaded));
        });
      },
    );
    on<GetPopularTvEvent>((event, emit) async {
      final result = await getPopularTvUseCase(const NoParameters());
      return result.fold((l) {
        emit(state.copyWith(
            popularTvsMessage: l.message,
            popularTvsStates: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
            popularTvs: r, popularTvsStates: RequestStates.loaded));
      });
    });
    on<GetTopRatedTvEvent>((event, emit) async {
      final result = await getTopRatedTvUseCase(const NoParameters());
      return result.fold((l) {
        emit(state.copyWith(
            topRatedTvsMessage: l.message,
            topRatedTvsStates: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
            topRatedTvs: r, topRatedTvsStates: RequestStates.loaded));
      });
    });
  }
}
