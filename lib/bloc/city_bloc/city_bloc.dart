import 'package:bloc/bloc.dart';
import 'package:weather_app/model/city_list/city_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../repository/city_api/city_repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvents, CityStates> {

  List<CityModel> tempList = [];

  CityRepository cityRepository = CityRepository();

  CityBloc() : super(CityStates()) {
    on<CitiesFetched>(_fetchCities);
    on<SearchCity>(_searchCities);
  }

  void _fetchCities(CitiesFetched event, Emitter<CityStates> emit) {
    cityRepository.fetchCities().then((val){
      emit(state.copyWith(cities: val));
    });
  }

  void _searchCities(SearchCity event, Emitter<CityStates> emit) {
    debugPrint("datad"+event.searchQuery.toString());

    tempList = state.cities.where((e)=> e.city.toLowerCase().startsWith(event.searchQuery.toLowerCase())).toList();
   debugPrint("datad"+tempList.toString());
   emit(state.copyWith(cities: tempList));
  }
}
