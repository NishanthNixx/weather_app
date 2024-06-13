part of 'weather_bloc.dart';

 class WeatherState extends Equatable {
  const WeatherState({
    required this.weather ,
  });
  final ApiResponse<Weather> weather  ;

  WeatherState copyWith({
    ApiResponse<Weather>? weather,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object> get props => [weather];
}


