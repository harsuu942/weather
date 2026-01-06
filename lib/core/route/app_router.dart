
import 'package:go_router/go_router.dart';

import '../../features/weather/presentation/page/weather_page.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const WeatherPage(),
    ),
  ],
);
