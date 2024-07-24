// ignore_for_file: file_names

import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class customRating extends StatelessWidget {
  const customRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rateing});
  final String rateing;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(rateing,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(2390)',
          style: Styles.textStyle14.copyWith(
              color: const Color(0xff707070), fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
