import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'core/network/dio_client.dart';

import 'core/route/app_router.dart';
import 'features/weather/data/remote/weather_api.dart';
import 'features/weather/data/repository/weather_repository_impl.dart';
import 'features/weather/domain/usecases/get_weather.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';

void main() {
  final Dio dio = DioClient.create();
  final api = WeatherApi(dio);
  final repository = WeatherRepositoryImpl(api);
  final useCase = GetWeather(repository);

  runApp(MyApp(useCase));
}

class MyApp extends StatelessWidget {
  final GetWeather useCase;

  const MyApp(this.useCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(useCase),
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
