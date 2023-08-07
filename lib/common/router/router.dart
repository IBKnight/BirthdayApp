import 'package:birthday_app/domain/entities/card_entity.dart';
import 'package:birthday_app/presentation/pages/detail_page.dart';
import 'package:go_router/go_router.dart';

import 'package:birthday_app/presentation/pages/guest_list_page.dart';
import 'package:birthday_app/presentation/pages/home_page.dart';
import 'package:birthday_app/presentation/pages/wishlist_page.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              CardEntity meal = state.extra as CardEntity;
              return DetailScreen(item: meal);
            },
          ),
          GoRoute(
            path: 'wishlist',
            builder: (context, state) => const WishlistPage(),
          ),
          GoRoute(
            path: 'guest_list',
            builder: (context, state) => const GuestListPage(),
          )
        ],
      ),
    ],
  );
}
