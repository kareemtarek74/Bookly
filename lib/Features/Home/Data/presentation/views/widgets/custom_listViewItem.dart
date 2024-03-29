// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

// ignore: camel_case_types
class customListViewItem extends StatelessWidget {
  const customListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
              image: const DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AssetsData.testimage))),
        ),
      ),
    );
  }
}
