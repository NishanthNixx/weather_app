part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent{
  final String searchQuery;
  const FetchWeather({required this.searchQuery});

  @override
  // TODO: implement props
  List<Object?> get props => [searchQuery];
}