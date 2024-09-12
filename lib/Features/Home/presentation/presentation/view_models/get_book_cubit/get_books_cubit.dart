import 'package:bookly/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit(this.api) : super(GetBooksInitial());
  final ApiConsumer api;

  getBook() async {
    try {
      emit(GetBooksLoading());
      final response = await api.get(
        "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=programming",
      );

      List<BookModel> book = [];
      book.add(BookModel.fromJson(response));

      emit(GetBooksSuccess(books: book));
    } on ServerException catch (e) {
      emit(GetBooksFailure(errMessage: e.errModel.error!.message!));
    }
  }
}
