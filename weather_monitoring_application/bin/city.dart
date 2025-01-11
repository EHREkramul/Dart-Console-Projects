enum WeatherCondition{
  sunny,
  rainy,
}
class City{
  City(this._name, this._temperature, this._condition, this._lastUpdated);

  final String _name;
  final double _temperature;
  late WeatherCondition _condition;
  final DateTime _lastUpdated;


  // Getter Methods
  String get name => _name;
  double get temperature => _temperature;
  WeatherCondition get weatherCondition => _condition;
  DateTime get lastUpdatedTime => _lastUpdated;

  set setWeatherCondition(WeatherCondition condition) => _condition = condition;
}