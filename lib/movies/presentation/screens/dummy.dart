import 'package:tvs_movies_app/core/shared/entities/generes.dart';
import 'package:tvs_movies_app/core/shared/entities/recommendations.dart';
import 'package:tvs_movies_app/movies/domain/entities/movie_details.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv_details.dart';

MovieDetails movieDetailDummy = const MovieDetails(
  backDroPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  genres: [
    Generes(name: 'Family', id: 10751),
  ],
  id: 438148,
  overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  releaseDate: "2022-06-29",
  runtime: 87,
  title: "Minions: The Rise of Gru",
  voteAverage: 7.8,
);

TvDetails tvDetailDummy = const TvDetails(
  backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  genres: [
    Generes(name: 'Family', id: 10751),
  ],
  id: 438148,
  overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  type: "",
  adult: true,
  numberOfEpisodes: 10,
  numberOfSeasons: 1,
  originalName: "A fanboy of a supervillain",
  posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  voteAverage: 7.8,
);

List<Recommendations> recommendationDummy = [
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendations(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
];
