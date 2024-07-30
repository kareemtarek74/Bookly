// ignore_for_file: file_names

import 'package:bookly/Features/Home/presentation/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/BooksList_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_listViewItem.dart';

// ignore: camel_case_types
class similarBooksListView extends StatelessWidget {
  const similarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books[0].items!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: customListViewItem(
                      imgUrl: state.books[0].items![index].volumeInfo!
                              .imageLinks?.thumbnail ??
                          ""),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const BooksList_loading_shimmer();
        }
      },
    );
  }
}
