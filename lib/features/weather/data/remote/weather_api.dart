import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio) = _WeatherApi;

  @GET('/forecast')
  Future<WeatherModel> getCurrentWeather({
    @Query('latitude') required double lat,
    @Query('longitude') required double lon,
    @Query('current_weather') bool currentWeather = true,
  });
}
