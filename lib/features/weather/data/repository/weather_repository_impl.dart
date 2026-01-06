import '../../domain/entities/weather.dart';
import '../../domain/repository/weather_repository.dart';
import '../remote/weather_api.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi api;

  WeatherRepositoryImpl(this.api);

  @override
  Future<Weather> getWeather(double lat, double lon) {
    return api.getCurrentWeather(lat: lat, lon: lon);
  }
}
