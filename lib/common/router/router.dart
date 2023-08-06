
import 'package:birthday_app/domain/entities/card_entity.dart';
import 'package:birthday_app/presentation/pages/detail_page.dart';
import 'package:go_router/go_router.dart';

import 'package:birthday_app/presentation/pages/guest_list_page.dart';
import 'package:birthday_app/presentation/pages/home_page.dart';
import 'package:birthday_app/presentation/pages/wishlist_page.dart';


// final router = GoRouter(routes: $appRoutes);
// @TypedGoRoute<HomeScreenRoute>(
//     path: Routes.home,
//     routes: [
//       TypedGoRoute<DetailsScreenRoute>(
//         path: Routes.details,
//       ),
//     ]
// )
//
//
// @immutable
// final class HomeScreenRoute extends GoRouteData {
//   @override
//   Widget build(BuildContext context, state) {
//     return const HomePage();
//   }
// }
//
// @immutable
// final class DetailsScreenRoute extends GoRouteData {
//
//   DetailsScreenRoute({required this.$extra});
//
//   final CardEntity $extra;
//
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     //final CardEntity meal = state.extra as CardEntity;
//     return DetailScreen(item: $extra);
//   }
// }
//


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
            builder: (context, state) => WishlistPage(),
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
