part of 'tv_details_bloc.dart';

class TvDetailsStates extends Equatable {
  final TvDetails? tvDetails;
  final RequestStates tvDetailsState;
  final String tvDetailsMessage;

  final List<Recommendations>? tvRecommendations;
  final RequestStates tvRecommendationsState;
  final String tvRecommendationsMessage;

  const TvDetailsStates({
    this.tvDetails,
    this.tvDetailsState = RequestStates.loading,
    this.tvDetailsMessage = "",
    this.tvRecommendations,
    this.tvRecommendationsState = RequestStates.loading,
    this.tvRecommendationsMessage = "",
  });

  TvDetailsStates copyWith({
    final TvDetails? tvDetails,
    final RequestStates? tvDetailsState,
    final String? tvDetailsMessage,
    final List<Recommendations>? tvRecommendations,
    final RequestStates? tvRecommendationsState,
    final String? tvRecommendationsMessage,
  }) {
    return TvDetailsStates(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvRecommendations: tvRecommendations ?? this.tvRecommendations,
      tvRecommendationsMessage:
          tvRecommendationsMessage ?? this.tvRecommendationsMessage,
      tvRecommendationsState:
          tvRecommendationsState ?? this.tvRecommendationsState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        tvDetails,
        tvDetailsMessage,
        tvDetailsState,
        tvRecommendations,
        tvRecommendationsMessage,
        tvRecommendationsState,
      ];
}
