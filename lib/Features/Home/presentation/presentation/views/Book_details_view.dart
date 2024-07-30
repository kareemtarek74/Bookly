// ignore_for_file: file_names

import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:bookly/Features/Home/presentation/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/widgets/Book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.bookModel,
  });
  final Item bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
      category: widget.bookModel.volumeInfo!.categories?[0] ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        book: widget.bookModel,
      ),
    );
  }
}
