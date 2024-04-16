import 'package:bookly/Features/Search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_view extends StatelessWidget {
  const Search_view({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: searchViewBody()),
    );
  }
}
