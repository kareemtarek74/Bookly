// ignore_for_file: file_names

import 'package:bookly/Features/Home/presentation/presentation/view_models/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/custom_BestSeller_ListView_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/presentation/presentation/views/widgets/BestSeller_loading_shimmer.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksCubitSuccess) {
        return ListView.builder(
          itemCount: state.books[0].items!.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BestSellerListViewItem(
                booky: state.books[0].items![index],
              ),
            );
          },
        );
      } else if (state is NewestBooksCubitFailure) {
        return Text(state.errMessage);
      } else {
        return const bestSeller_LoadingShimmer();
      }
    });
  }
}
