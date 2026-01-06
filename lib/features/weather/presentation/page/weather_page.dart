import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return switch (state) {
              WeatherLoading() => const CircularProgressIndicator(),
              WeatherLoaded(:final weather) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${weather.temperature} °C'),
                  Text('${weather.windSpeed} km/h'),
                ],
              ),
              WeatherError(:final message) => Text(message),
              _ => ElevatedButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(
                    FetchWeather(23.02, 72.57),
                  );
                },
                child: const Text('Load Weather'),
              ),
            };
          },
        ),
      ),
    );
  }
}
