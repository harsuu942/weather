import 'package:equatable/equatable.dart';

sealed class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeather extends WeatherEvent {
  final double lat;
  final double lon;

  FetchWeather(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}
