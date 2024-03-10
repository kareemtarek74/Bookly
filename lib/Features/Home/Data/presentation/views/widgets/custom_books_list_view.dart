import 'package:flutter/material.dart';

import 'custom_listViewItem.dart';

// ignore: camel_case_types
class customBooksListView extends StatelessWidget {
  const customBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
