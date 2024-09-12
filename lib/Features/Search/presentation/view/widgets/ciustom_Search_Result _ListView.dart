// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/custom_BestSeller_ListView_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.book});
  final List<Item> book;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: book.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(
            booky: book[index],
          ),
        );
      },
    );
  }
}
