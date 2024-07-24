// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

// ignore: camel_case_types
class BooksList_loading_shimmer extends StatelessWidget {
  const BooksList_loading_shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2.7 / 4,
                    child: ShimmerPro.sized(
                      light: ShimmerProLight.lighter,
                      scaffoldBackgroundColor: Colors.white,
                      height: 230,
                      width: 170,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
