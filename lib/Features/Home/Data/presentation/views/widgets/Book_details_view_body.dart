// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BookDetails_AppBar.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_Rating.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_listViewItem.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: const customListViewItem(),
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              'The Jungle Book',
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: .7,
              child: Text(
                'Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const customRating(
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
