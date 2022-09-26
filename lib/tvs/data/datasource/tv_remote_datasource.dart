import 'package:dio/dio.dart';
import 'package:tvs_movies_app/core/error/exceptions.dart';
import 'package:tvs_movies_app/core/network/api_constants.dart';
import 'package:tvs_movies_app/core/network/error_message_model.dart';
import 'package:tvs_movies_app/core/shared/models/recommendation_model.dart';
import 'package:tvs_movies_app/tvs/data/models/tv_details_model.dart';
import 'package:tvs_movies_app/tvs/data/models/tv_model.dart';
import 'package:tvs_movies_app/tvs/domain/usecases/get_tv_details_usecase.dart';

import '../../domain/usecases/get_tv_recommmendation_usecase.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirUseCase();

  Future<List<TvModel>> getTopRatedTvUseCase();

  Future<List<TvModel>> getPopularTvUseCase();

  Future<TvDetailsModel> getTvDetailsUseCase(TvDetailsParameters parameters);

  Future<List<RecommendationModel>> getTvRecommendationUseCase(
      TvRecommendationsParameters parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirUseCase() async {
    final response = await Dio().get(ApiConstants.onTheAirTvsPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvDetailsModel> getTvDetailsUseCase(
      TvDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.getTvDetailsPathById(parameters.id));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopularTvUseCase() async {
    final response = await Dio().get(ApiConstants.popularTvsPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvUseCase() async {
    final response = await Dio().get(ApiConstants.topRatedTvsPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getTvRecommendationUseCase(
      TvRecommendationsParameters parameters) async {
    final response = await Dio()
        .get(ApiConstants.getTvRecommendationPathById(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
