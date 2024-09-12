import 'package:bookly/Features/Authentication/presentation/view_models/user_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/view_models/get_book_cubit/get_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/view_models/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Repositories/user_repository.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/Api/Dio_consumer.dart';
import 'package:bookly/core/cache/cache_helper.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => GetBooksCubit(DioConsumer(dio: Dio()))..getBook(),
      ),
      BlocProvider(
        create: (context) =>
            NewestBooksCubit(DioConsumer(dio: Dio()))..getNewestBook(),
      ),
      BlocProvider(
        create: (context) =>
            UserCubit(UserRepository(Api: DioConsumer(dio: Dio()))),
      ),
    ], child: const BooklyApp()),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
    );
  }
}
