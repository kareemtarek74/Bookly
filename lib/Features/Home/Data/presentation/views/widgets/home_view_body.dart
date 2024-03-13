import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Best Seller', style: Styles.textStyle18),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BestSellerListViewItem())
      ],
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 125,
          child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                  image: const DecorationImage(
                      image: AssetImage(AssetsData.testimage),
                      fit: BoxFit.fill)),
            ),
          ),
        )
      ],
    );
  }
}
