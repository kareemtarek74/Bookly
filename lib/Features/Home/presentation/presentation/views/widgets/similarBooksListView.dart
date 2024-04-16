// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'custom_listViewItem.dart';

// ignore: camel_case_types
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: customListViewItem(),
          );
        },
      ),
    );
  }
}
