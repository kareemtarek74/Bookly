import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.api) : super(const NewestBooksCubitInitial());
  final ApiConsumer api;

  TextEditingController searchValue = TextEditingController();
  List<BookModel> book = [];
  List<BookModel> searchList = [];
  getNewestBook() async {
    try {
      emit(NewestBooksCubitLoading());
      final response = searchValue.text.isEmpty
          ? await api.get(
              "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q= computer science",
            )
          : {
              await api.get(
                "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=${searchValue.text}",
              )
            };

      book.add(BookModel.fromJson(response));

      emit(NewestBooksCubitSuccess(books: book));
    } on ServerException catch (e) {
      emit(NewestBooksCubitFailure(errMessage: e.errModel.error!.message!));
    }
  }
}
