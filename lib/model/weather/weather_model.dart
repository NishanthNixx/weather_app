// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';



@freezed
class Weather with _$Weather {
  const factory Weather({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Current with _$Current {
  const factory Current({
    double? tempC,
    double? tempF,
    int? isDay,
    CurrentCondition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@freezed
class CurrentCondition with _$CurrentCondition {
  const factory CurrentCondition({
    String? text,
    String? icon,
  }) = _CurrentCondition;

  factory CurrentCondition.fromJson(Map<String, dynamic> json) => _$CurrentConditionFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    List<Forecastday>? forecastday,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}

@freezed
class Forecastday with _$Forecastday {
  const factory Forecastday({
    DateTime? date,
    int? dateEpoch,
    Day? day,
  }) = _Forecastday;

  factory Forecastday.fromJson(Map<String, dynamic> json) => _$ForecastdayFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    DayCondition? condition,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class DayCondition with _$DayCondition {
  const factory DayCondition({
    String? text,
    String? icon,
    int? code,
  }) = _DayCondition;

  factory DayCondition.fromJson(Map<String, dynamic> json) => _$DayConditionFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
