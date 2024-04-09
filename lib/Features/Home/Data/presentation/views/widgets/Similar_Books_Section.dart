// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'similarBooksListView.dart';

// ignore: camel_case_types
class similarBooksSection extends StatelessWidget {
  const similarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'You may also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const similarBooksListView(),
      ],
    );
  }
}
