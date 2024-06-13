import 'package:weather_app/repository/weather_repository/weather_api_repository.dart';

import '../../data/network/network_api_services.dart';
import '../../model/movie_list/movie_list_model.dart';
import '../../model/weather/weather_model.dart';
import '../../utils/app_url.dart';


/// Implementation of [WeatherApiRepository] for making HTTP requests to fetch movies list.
class WeatherHttpApiRepository implements WeatherApiRepository {
  final _apiServices = NetworkApiService();

  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  @override
  Future<Weather> fetchWeather({required String query}) async {
    final response = await _apiServices.getApi(AppUrl.weatherUrl+query);
    return Weather.fromJson(response);
  }
}
