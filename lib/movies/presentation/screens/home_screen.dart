import 'package:flutter/material.dart';
import 'package:tvs_movies_app/core/shared/functions.dart';
import 'package:tvs_movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:tvs_movies_app/tvs/presentation/screens/tvs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildMoviesBackground(context),
          builHorizontalDivider(context),
          buildTVsBackground(context),
        ],
      ),
    );
  }

  buildMoviesBackground(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharedFunctions.doNavigation(context, const MoviesScreen());
      },
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5 - 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/movies_image.jpg",
                ),
                fit: BoxFit.fill),
          ),
        ),
        Container(
            color: Colors.grey.shade300.withOpacity(0.3),
            child: const Text(
              "Movies",
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
      ]),
    );
  }

  builHorizontalDivider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 4,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )
          // color: Colors.black45,
          ),
    );
  }

  buildTVsBackground(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharedFunctions.doNavigation(context, const TvsScreen());
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5 - 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/tv_image.png",
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
              color: Colors.grey.shade300.withOpacity(0.3),
              child: const Text(
                "TV",
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
        ],
      ),
    );
  }
}
