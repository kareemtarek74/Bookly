// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/presentation/views/widgets/Books_Action.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BookDetails_AppBar.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_Rating.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_listViewItem.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/utils/widgets/custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
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
                    height: 24,
                  ),
                  Text(
                    'The Jungle Book',
                    style: Styles.textStyle30
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
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
                    height: 12,
                  ),
                  const customRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const BooksAction(),
                  const Expanded(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        'You may also like',
                        style: Styles.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const similarBooksListView(),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class similarBooksListView extends StatelessWidget {
  const similarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: customListViewItem(),
          );
        },
      ),
    );
  }
}
