import 'package:flutter/material.dart';

import 'custom_appBar.dart';

// ignore: camel_case_types
class homeViewBody extends StatelessWidget {
  const homeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [customAppBar()],
    );
  }
}
