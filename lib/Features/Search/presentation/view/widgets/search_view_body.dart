import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_BestSeller_ListView_item.dart';
import 'package:bookly/Features/Home/Data/presentation/views/widgets/custom_books_list_view.dart';
import 'package:bookly/Features/Search/presentation/view/widgets/custom_Search_TextField.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class searchViewBody extends StatelessWidget {
  const searchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text('Search Result', style: Styles.textStyle18),
          SizedBox(
            height: 8,
          ),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
