import 'package:bloc/bloc.dart';
import 'package:weather_app/model/weather/weather_model.dart';
import 'package:weather_app/repository/weather_repository/weather_api_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/response/api_response.dart';
import '../../utils/enums.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherApiRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherState(weather: ApiResponse.loading())) {
    on<FetchWeather>(fetchWeatherApi);

  }

  Future<void> fetchWeatherApi(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(
      weather: ApiResponse.loading(),
    ));
    await weatherRepository.fetchWeather(query: event.searchQuery).then((response) {
      emit(state.copyWith(
        weather: ApiResponse.completed(response),
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        weather: ApiResponse.error(error.toString()),
      ));
    });
  }


}
