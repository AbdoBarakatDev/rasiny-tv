import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvs_movies_app/core/localization/app_localization.dart';
import 'package:tvs_movies_app/movies/presentation/screens/see_more_screen.dart';
import 'package:tvs_movies_app/tvs/presentation/components/on_air_component.dart';
import 'package:tvs_movies_app/tvs/presentation/components/popular_component.dart';
import 'package:tvs_movies_app/tvs/presentation/components/top_rated_component.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_bloc.dart';
import 'package:tvs_movies_app/tvs/presentation/controller/tv_event.dart';
import 'package:tvs_movies_app/tvs/presentation/screens/see_more_screen.dart';
import 'package:tvs_movies_app/utils/app_strings.dart';
import '../../../core/services/services_locator.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetOnTheAirTvEvent())
        ..add(GetPopularTvEvent())
        ..add(GetTopRatedTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnAirComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalization.of(context)!.translate(AppStrings.popular).toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SeeMoreMoviesScreen(isTopRated: false),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:  [
                            Text(
                              AppLocalization.of(context)!.translate(AppStrings.seeMore).toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TvPopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalization.of(context)!.translate(AppStrings.topRated).toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SeeMoreMoviesScreen(isTopRated: true),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:  [
                            Text(
                              AppLocalization.of(context)!.translate(AppStrings.seeMore).toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TvTopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
