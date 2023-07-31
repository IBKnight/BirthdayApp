import 'package:go_router/go_router.dart';

import 'package:birthday_app/feature/presentation/pages/detail_page.dart';
import 'package:birthday_app/feature/presentation/pages/guest_list_page.dart';
import 'package:birthday_app/feature/presentation/pages/home_page.dart';
import 'package:birthday_app/feature/presentation/pages/wishlist_page.dart';


abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) => const DetailScreen(), //TODO: реализовать передачу параметров
          ),
          GoRoute(
            path: 'wishlist',
            builder: (context, state) => WishlistPage(),
          ),
          GoRoute(
            path: 'guest_list',
            builder: (context, state) => GuestListPage(),
          )
        ],
      ),
    ],
  );
}
