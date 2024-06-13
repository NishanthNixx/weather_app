part of 'city_bloc.dart';

abstract class CityEvents extends Equatable {
  const CityEvents();

  @override
  List<Object> get props => [];
}

class CitiesFetched extends CityEvents {
  
}

class SearchCity extends CityEvents {
  final String searchQuery;
  SearchCity(this.searchQuery);

}