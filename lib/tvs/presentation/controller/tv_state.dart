import 'package:equatable/equatable.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class TvsStates extends Equatable {
  final List<Tv> onTheAirTvs;
  final RequestStates onTheAirTvsStates;
  final String onTheAirTvsMessage;

  final List<Tv> popularTvs;
  final RequestStates popularTvsStates;
  final String popularTvsMessage;

  final List<Tv> topRatedTvs;
  final RequestStates topRatedTvsStates;
  final String topRatedTvsMessage;

  const TvsStates({
    this.onTheAirTvs = const [],
    this.onTheAirTvsStates = RequestStates.loading,
    this.onTheAirTvsMessage = "",
    this.popularTvs = const [],
    this.popularTvsStates = RequestStates.loading,
    this.popularTvsMessage = "",
    this.topRatedTvs = const [],
    this.topRatedTvsStates = RequestStates.loading,
    this.topRatedTvsMessage = "",
  });

  TvsStates copyWith({
    List<Tv>? onTheAirTvs,
    RequestStates? onTheAirTvsStates,
    String? onTheAirTvsMessage,
    List<Tv>? popularTvs,
    RequestStates? popularTvsStates,
    String? popularTvsMessage,
    List<Tv>? topRatedTvs,
    RequestStates? topRatedTvsStates,
    String? topRatedTvsMessage,
  }) {
    return TvsStates(
        onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
        onTheAirTvsMessage: onTheAirTvsMessage ?? this.onTheAirTvsMessage,
        onTheAirTvsStates: onTheAirTvsStates ?? this.onTheAirTvsStates,
        topRatedTvs: topRatedTvs ?? this.topRatedTvs,
        topRatedTvsMessage: topRatedTvsMessage ?? this.topRatedTvsMessage,
        topRatedTvsStates: topRatedTvsStates ?? this.topRatedTvsStates,
        popularTvs: popularTvs ?? this.popularTvs,
        popularTvsMessage: popularTvsMessage ?? this.popularTvsMessage,
        popularTvsStates: popularTvsStates ?? this.popularTvsStates);
  }

  @override
// TODO: implement props
  List<Object?> get props => [
        onTheAirTvs,
        onTheAirTvsStates,
        onTheAirTvsMessage,
        popularTvs,
        popularTvsStates,
        popularTvsMessage,
        topRatedTvs,
        topRatedTvsStates,
        topRatedTvsMessage,
      ];
}
