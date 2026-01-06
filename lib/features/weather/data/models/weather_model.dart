import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/weather.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather {
  @JsonKey(name: 'current_weather')
  final CurrentWeather current;

  WeatherModel(this.current)
      : super(
    temperature: current.temperature,
    windSpeed: current.windSpeed,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class CurrentWeather {
  final double temperature;

  @JsonKey(name: 'windspeed')
  final double windSpeed;

  CurrentWeather(this.temperature, this.windSpeed);

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}
