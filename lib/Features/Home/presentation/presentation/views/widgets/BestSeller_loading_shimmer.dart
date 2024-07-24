// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

// ignore: camel_case_types
class bestSeller_LoadingShimmer extends StatelessWidget {
  const bestSeller_LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: AspectRatio(
                            aspectRatio: 2.5 / 4,
                            child: ShimmerPro.sized(
                              light: ShimmerProLight.lighter,
                              scaffoldBackgroundColor: Colors.white,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: .65,
                                child: ShimmerPro.text(
                                  alignment: Alignment.centerLeft,
                                  light: ShimmerProLight.lighter,
                                  width: 200,
                                  maxLine: 4,
                                  scaffoldBackgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
