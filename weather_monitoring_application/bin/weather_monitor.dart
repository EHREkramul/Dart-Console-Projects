import 'city.dart';

class WeatherMonitor{
  final List<City> _cities = [];

  void addCityWeather(String cityName, double cityTemperature, WeatherCondition cityWeatherCondition){
    City newCity = City(cityName, cityTemperature, cityWeatherCondition, DateTime.now());

    _cities.add(newCity);
    print("${_cities.last.name} Added to Weather Data");
  }

  void updateWeatherCondition(WeatherCondition condition, String cityName){
    try{
      var city = _cities.firstWhere((city) => city.name == cityName);
      city.setWeatherCondition = condition;
      print('Weather condition Updated');
    }catch(e){
      print('No city found in that name: $e');
    }
  }

  Future<void> displayCities() async {
    print('Getting Cities');
    await Future.delayed(Duration(seconds: 2));

    var cities = _cities;
    cities.sort((a,b) => a.temperature.compareTo(b.temperature));

    for(var city in cities){
      print("City: ${city.name}, Temperature: ${city.temperature}");
    }
    print('');
  }

  Future<void> showCityByCondition(WeatherCondition condition) async {
    print('Getting Cities');
    await Future.delayed(Duration(seconds: 2));

    var cities = _cities.where((city) => city.weatherCondition == condition);

    for(var city in cities){
      print("City: ${city.name}, Temperature: ${city.temperature}, Condition: ${city.weatherCondition}");
    }
    print('');
  }
}