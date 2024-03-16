import 'package:bookly/Features/Home/Data/presentation/views/Book_details_view.dart';
import 'package:bookly/Features/Home/Data/presentation/views/home_view.dart';
import 'package:bookly/Features/Splash/presentation/views/Splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: '/HomeView',
      builder: (context, state) => const homeView(),
    ),
    GoRoute(
      path: '/BookDetailsView',
      builder: (context, state) => const BookDetailsView(),
    )
  ]);
}
