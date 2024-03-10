import 'package:flutter/material.dart';

import 'custom_listViewItem.dart';

class customBooksListView extends StatelessWidget {
  const customBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: customListViewItem(),
          );
        },
      ),
    );
  }
}
