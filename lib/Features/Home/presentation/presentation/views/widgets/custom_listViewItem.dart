// ignore_for_file: file_names

import 'package:bookly/Features/Home/presentation/presentation/views/widgets/BooksList_loading_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customListViewItem extends StatelessWidget {
  const customListViewItem({super.key, required this.imgUrl});
  final String? imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            imageUrl: imgUrl ?? "",
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const Center(
              child: BooksList_loading_shimmer(),
            ),
          ),
        ),
      ),
    );
  }
}
