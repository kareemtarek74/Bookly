// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/custom_BookDetails_AppBar.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Books_Details_Section.dart';
import 'Similar_Books_Section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.book,
  });
  final Item book;
  @override
  Widget build(BuildContext context) {
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
                  booksDetailsSection(
                    book: book,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  const similarBooksSection(),
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
