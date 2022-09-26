class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "api_key=8323750c58f8db5099a069b6a1f9900e";

  /// for Movies part
  static const String moviesPath = "/movie/";
  static const String recommendationsPath = "/recommendations";
  static const String nowPlayingMoviesPath =
      "$baseUrl${moviesPath}now_playing?$apiKey";
  static const String popularMoviesPath =
      "$baseUrl${moviesPath}popular?$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl${moviesPath}top_rated?$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String imgPath) => "$baseImageUrl$imgPath";

  static String getMovieDetailsPathById(int movieId) {
    return "$baseUrl$moviesPath${movieId.toString()}?$apiKey";
  }

  static String getMovieRecommendationPathById(int movieId) {
    return "$baseUrl$moviesPath${movieId.toString()}$recommendationsPath?$apiKey";
  }

  /// for Tvs part
  static const String tvsPath = "/tv/";
  static const String onTheAirTvsPath = "$baseUrl${tvsPath}on_the_air?$apiKey";
  static const String popularTvsPath = "$baseUrl${tvsPath}popular?$apiKey";
  static const String topRatedTvsPath = "$baseUrl${tvsPath}top_rated?$apiKey";

  static String getTvDetailsPathById(int movieId) {
    return "$baseUrl$tvsPath${movieId.toString()}?$apiKey";
  }

  static String getTvRecommendationPathById(int movieId) {
    return "$baseUrl$tvsPath${movieId.toString()}$recommendationsPath?$apiKey";
  }
}
