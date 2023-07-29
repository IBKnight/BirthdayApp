import 'package:birthday_app/feature/presentation/pages/detail_screen.dart';
import 'package:birthday_app/feature/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) => const DetailScreen(), //TODO: реализовать передачу параметров
          ),
        ],
      ),
    ],
  );
}
