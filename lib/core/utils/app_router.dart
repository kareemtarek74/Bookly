import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:bookly/Features/Home/presentation/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/Book_details_view.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/home_view.dart';
import 'package:bookly/Features/Search/presentation/view/search_view.dart';
import 'package:bookly/Features/Splash/presentation/views/Splash_view.dart';
import 'package:bookly/core/Api/Dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      path: '/Search_view',
      builder: (context, state) => const Search_view(),
    ),
    GoRoute(
      path: '/BookDetailsView',
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(DioConsumer(dio: Dio())),
        child: BookDetailsView(
          bookModel: state.extra as Item,
        ),
      ),
    ),
  ]);
}
