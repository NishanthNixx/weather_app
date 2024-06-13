

import 'package:weather_app/repository/weather_repository/weather_api_repository.dart';
import 'package:weather_app/repository/weather_repository/weather_http_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'configs/themes/dark_theme.dart';
import 'configs/themes/light_theme.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensuring that Flutter bindings are initialized
  servicesLocator(); // Initializing service locator for dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});


  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Weather App',
          themeMode: ThemeMode.light, // Setting theme mode to dark
          theme: lightTheme, // Setting light theme
          darkTheme: darkTheme, // Setting dark theme
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English locale
            Locale('es'), // Spanish locale
          ],
          initialRoute: RoutesName.splash, // Initial route
          onGenerateRoute: Routes.generateRoute, // Generating routes
        );
      }
    );
  }
}

// Function for initializing service locator
void servicesLocator() {
  getIt.registerLazySingleton<WeatherApiRepository>(()=>WeatherHttpApiRepository());// Registering WeatherHttpApiRepository as a lazy singleton for WeatherApiRepository
}
