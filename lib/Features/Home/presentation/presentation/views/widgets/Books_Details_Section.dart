// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'Books_Action.dart';
import 'custom_Rating.dart';
import 'custom_listViewItem.dart';

// ignore: camel_case_types
class booksDetailsSection extends StatelessWidget {
  const booksDetailsSection({
    super.key,
    required this.book,
  });
  final Item book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: customListViewItem(
            imgUrl: book.volumeInfo!.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          textAlign: TextAlign.center,
          book.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 2,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo!.authors![0],
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
          rateing: '4.8',
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
