// ignore_for_file: file_names

import 'package:bookly/Features/Splash/presentation/views/view_models/splash_viewBody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
