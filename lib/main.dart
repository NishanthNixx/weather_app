// Importing necessary packages and files

import 'package:weather_app/repository/weather_repository/weather_api_repository.dart';
import 'package:weather_app/repository/weather_repository/weather_http_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Localization support
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart'; // Package for dependency injection
import 'package:sizer/sizer.dart';

import 'configs/routes/routes.dart'; // Custom routes
import 'configs/routes/routes_name.dart'; // Route names
import 'configs/themes/dark_theme.dart'; // Dark theme configuration
import 'configs/themes/light_theme.dart'; // Light theme configuration

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensuring that Flutter bindings are initialized
  servicesLocator(); // Initializing service locator for dependency injection
  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor for MyApp widget

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Material app configuration
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
