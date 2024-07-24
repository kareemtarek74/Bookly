import 'package:bookly/Features/Home/presentation/presentation/view_models/get_book_cubit/get_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/BooksList_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_listViewItem.dart';

// ignore: camel_case_types
class customBooksListView extends StatelessWidget {
  const customBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBooksCubit, GetBooksState>(
      builder: (context, state) {
        if (state is GetBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books[0].items!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: customListViewItem(
                      imageUrl: state.books[0].items![index].volumeInfo!
                          .imageLinks!.thumbnail!),
                );
              },
            ),
          );
        } else if (state is GetBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const BooksList_loading_shimmer();
        }
      },
    );
  }
}
