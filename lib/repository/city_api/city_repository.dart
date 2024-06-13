import 'package:weather_app/model/city_list/city_model.dart';
import 'package:weather_app/utils/constants.dart';

class CityRepository {

  Future<List<CityModel>> fetchCities() async{

    return Constants().cities;
  }

}