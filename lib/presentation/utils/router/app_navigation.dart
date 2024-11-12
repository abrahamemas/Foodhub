import 'package:foodhub/presentation/screens/home/category1/mexican_category.dart';
import 'package:go_router/go_router.dart';
import 'package:foodhub/presentation/screens/home/splash_screen/splash_screen.dart';
import 'package:foodhub/presentation/screens/home/welcome_screen/welcome_screen.dart';
import 'package:foodhub/presentation/screens/home/cart/cart.dart';
import 'package:foodhub/presentation/screens/home/favorites/favorites.dart';
import 'package:foodhub/presentation/screens/home/home_screen/home_screen.dart';
import 'package:foodhub/presentation/screens/home/orders/orders.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/splash_screen";

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    routes: [
      GoRoute(
        path: '/splash_screen',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome_screen',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/home_screen',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const Cart(),
      ),
      GoRoute(
        path: '/category1',
        builder: (context, state) => const MexicanCategoryScreen(
          recipeCount: 5,
        ),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const Favorites(),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const Orders(),
      ),
    ],
  );
}
