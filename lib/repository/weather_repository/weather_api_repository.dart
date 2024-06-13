import 'package:weather_app/model/weather/weather_model.dart';



/// Abstract class defining methods for movies API repositories.
abstract class WeatherApiRepository {
  /// Fetches the list of movies from the API.
  ///
  /// Returns a [Weather] representing the list of movies.
  Future<Weather> fetchWeather({required String query});
}
