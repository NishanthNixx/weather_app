import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart'; // Importing generated code for Freezed classes
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  /// Factory constructor for creating a [CityModel] instance.
  factory CityModel({
    @Default('') String city, // Total number of movies
    @Default('') String country, // Total number of movies

  }) = _CityModel; // Constructor for the freezed class

  /// Factory constructor for creating a [CityModel] instance from JSON.
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json); // JSON deserialization method
}