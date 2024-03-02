import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'Features/Splash/presentation/views/Splash_view.dart';

void main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashView(),
    );
  }
}
