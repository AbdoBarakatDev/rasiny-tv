import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tvs_movies_app/core/network/api_constants.dart';
import 'package:tvs_movies_app/core/services/services_locator.dart';
import 'package:tvs_movies_app/tvs/domain/entities/tv.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_bloc.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_event.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_state.dart';
import 'package:tvs_movies_app/tvs/presentation/screens/tv_detail_screen.dart';
import 'package:tvs_movies_app/utils/enums.dart';

class SeeMoreMoviesScreen extends StatelessWidget {
  final bool isTopRated;

  const SeeMoreMoviesScreen({Key? key, required this.isTopRated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetTopRatedTvEvent())
        ..add(GetPopularTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: buildSeeMore(isTopRated: isTopRated),
      ),
    );
  }

  buildSeeMore({required bool isTopRated}) {
    return BlocBuilder<TvBloc, TvsStates>(
      builder: (context, state) {
        if (isTopRated) {
          switch (state.topRatedTvsStates) {
            case RequestStates.loading:
              return buildLoadingIndicator();
            case RequestStates.loaded:
              return buildListItems(isTopRated: true, state: state);

            case RequestStates.error:
              return buildErrorView();
          }
        } else {
          switch (state.popularTvsStates) {
            case RequestStates.loading:
              return buildLoadingIndicator();
            case RequestStates.loaded:
              return buildListItems(isTopRated: false, state: state);
            case RequestStates.error:
              return buildErrorView();
          }
        }
      },
    );
  }

  buildSeeMoreImage(Tv tv) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          width: 120.0,
          height: 150,
          fit: BoxFit.cover,
          imageUrl: ApiConstants.imageUrl(tv.backdropPath),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: 150.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  buildSeeMoreDetails(Tv tv) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        tv.originalName,
        maxLines: 2,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text(
                tv.releaseDate,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Text(
            tv.voteAverage.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        tv.overview,
        maxLines: 4,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    ]));
  }

  buildListItems({required bool isTopRated, required TvsStates state}) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: GestureDetector(
            onTap: () {
              /// todo: NavigateToMovieDetails
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TvDetailScreen(
                    id: isTopRated
                        ? state.topRatedTvs[index].id
                        : state.popularTvs[index].id);
              }));
            },
            child: Card(
              color: Colors.grey.shade700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    isTopRated
                        ? buildSeeMoreImage(state.topRatedTvs[index])
                        : buildSeeMoreImage(state.popularTvs[index]),
                    const SizedBox(
                      width: 10,
                    ),
                    isTopRated
                        ? buildSeeMoreDetails(state.topRatedTvs[index])
                        : buildSeeMoreDetails(state.popularTvs[index]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount:
          isTopRated ? state.topRatedTvs.length : state.popularTvs.length,
    );
  }

  buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  buildErrorView() {
    return const Center(
      child: Text("Error"),
    );
  }
}
