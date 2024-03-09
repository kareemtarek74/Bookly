import 'package:bookly/Features/Home/Data/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: homeViewBody(),
    );
  }
}
