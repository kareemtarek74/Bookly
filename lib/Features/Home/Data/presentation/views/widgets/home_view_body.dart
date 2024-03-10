import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'custom_appBar.dart';
import 'custom_listViewItem.dart';

// ignore: camel_case_types
class homeViewBody extends StatelessWidget {
  const homeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        customAppBar(),
        customListViewItem(),
      ],
    );
  }
}
