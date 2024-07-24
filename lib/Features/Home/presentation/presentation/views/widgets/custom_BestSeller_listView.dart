// ignore_for_file: file_names

import 'package:bookly/Features/Home/presentation/presentation/view_models/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/custom_BestSeller_ListView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              itemCount: state.books[0].items!.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(
                    booky: state.books[0].items![index],
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBooksCubitFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
