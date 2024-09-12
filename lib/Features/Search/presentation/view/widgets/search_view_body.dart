import 'package:bookly/Features/Search/presentation/view/widgets/ciustom_Search_Result%20_ListView.dart';
import 'package:bookly/Features/Search/presentation/view/widgets/custom_Search_TextField.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/presentation/presentation/view_models/newest_books_cubit/newest_books_cubit_cubit.dart';
import '../../../../Home/presentation/presentation/views/widgets/BestSeller_loading_shimmer.dart';

// ignore: camel_case_types
class searchViewBody extends StatelessWidget {
  const searchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksCubitSuccess) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSearchTextField(
                  onChanged: (searchName) =>
                      BlocProvider.of<NewestBooksCubit>(context)
                          .book[0]
                          .items![0]
                          .volumeInfo!
                          .title!
                          .contains(searchName),
                  controller:
                      BlocProvider.of<NewestBooksCubit>(context).searchValue,
                  onPressesd: () {
                    BlocProvider.of<NewestBooksCubit>(context)
                        .searchValue
                        .clear();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Search Result', style: Styles.textStyle18),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                    child: SearchResultListView(book: state.books[0].items!)),
              ],
            ));
      } else if (state is NewestBooksCubitFailure) {
        return Text(state.errMessage);
      } else {
        return const bestSeller_LoadingShimmer();
      }
    });
  }
}
