import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_weather.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event,
      Emitter<WeatherState> emit,
      ) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeather(event.lat, event.lon);
      emit(WeatherLoaded(weather));
    } catch (_) {
      emit(WeatherError('Unable to fetch weather'));
    }
  }
}
