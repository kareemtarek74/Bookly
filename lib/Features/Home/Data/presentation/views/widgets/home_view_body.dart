import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BestSeller_ListView_item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_appBar.dart';
import 'custom_books_list_view.dart';

// ignore: camel_case_types
class homeViewBody extends StatelessWidget {
  const homeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customAppBar(),
        customBooksListView(),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Best Seller', style: Styles.textStyle18),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListViewItem())
      ],
    );
  }
}
