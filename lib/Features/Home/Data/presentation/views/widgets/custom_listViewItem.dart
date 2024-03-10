import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

class customListViewItem extends StatelessWidget {
  const customListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          height: 300,
          width: 200,
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
