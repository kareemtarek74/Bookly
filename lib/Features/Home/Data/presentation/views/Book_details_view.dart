// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BookDetails_AppBar.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: const Column(
        children: [customBookDetailsAppBar()],
      ),
    );
  }
}
