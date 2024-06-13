part of 'city_bloc.dart';

class CityStates extends Equatable {
  const CityStates({this.cities = const <CityModel>[],this.searchedCities = const <CityModel>[],});


  final List<CityModel> cities;
  final List<CityModel> searchedCities;

  CityStates copyWith({ List<CityModel>? cities, List<CityModel>? searchedCities}) {
    return CityStates(cities: cities ?? this.cities,searchedCities: searchedCities ?? this.searchedCities);
  }

  @override
  List<Object> get props => [cities,searchedCities];
}