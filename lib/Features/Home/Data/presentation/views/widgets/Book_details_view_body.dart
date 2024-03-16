// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BookDetails_AppBar.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_listViewItem.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const customBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .17),
              child: const customListViewItem(),
            )
          ],
        ),
      ),
    );
  }
}
