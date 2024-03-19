import 'package:flutter_state_managements/favorite_app/screens/favorite.dart';
import 'package:flutter_state_managements/favorite_app/screens/movies.dart';
import 'package:flutter_state_managements/signIn_app/login.dart';
import 'package:flutter_state_managements/signIn_app/user_info_page.dart';
// import 'package:flutter_state_managements/splash.dart';
import 'package:go_router/go_router.dart';

class RouteHelpers {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'movies',
        builder: (context, state) {
          return const Movies();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/user-info',
        name: 'user-info',
        builder: (context, state) {
          final Map<String, String> data = state.extra as Map<String, String>;
          return UserInfo(
            email: data['userEmail']!,
          );
        },
      ),
      GoRoute(
        path: '/favorite',
        name: 'favorite',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return FavoritePage(
            favoritemovies: data['favorite_movies'],
          );
        },
      ),
    ],
  );
}
