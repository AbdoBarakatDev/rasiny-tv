import 'package:flutter/material.dart';
import 'package:tvs_movies_app/core/localization/app_localization.dart';
import 'package:tvs_movies_app/core/services/services_locator.dart';
import 'package:tvs_movies_app/movies/presentation/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),

      supportedLocales: const [Locale("en", "US"), Locale("ar", "EG")],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (local, supportedLocals) {
        for (var supportedLocal in supportedLocals) {
          if (supportedLocal.languageCode == local?.languageCode &&
              supportedLocal.countryCode == local?.countryCode) {
            return supportedLocal;
          }
        }
        return supportedLocals.first;
      },

    );
  }
}
