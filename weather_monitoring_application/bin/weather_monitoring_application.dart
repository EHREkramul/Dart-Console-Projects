import 'city.dart';
import 'weather_monitor.dart';

void main() async {
  WeatherMonitor monitor = WeatherMonitor();

  monitor.addCityWeather('Tangail', 23.4, WeatherCondition.rainy);
  monitor.addCityWeather('Dhaka', 32, WeatherCondition.rainy);
  monitor.addCityWeather('Noakhali', 25, WeatherCondition.rainy);
  monitor.addCityWeather('Rajshahi', 30.9, WeatherCondition.sunny);
  print('');

  await monitor.displayCities();

  monitor.updateWeatherCondition(WeatherCondition.sunny, 'Dhaka');
  await monitor.displayCities();

  await monitor.showCityByCondition(WeatherCondition.sunny);
}