import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Data/models/book_model/book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.api) : super(SimilarBooksInitial());

  final ApiConsumer api;

  getSimilarBooks({required String category}) async {
    try {
      emit(SimilarBooksLoading());
      final response = await api.get(
        "/volumes?sorting=relevance&Filtering=free-ebooks&q=computer science",
      );

      List<BookModel> book = [];
      book.add(BookModel.fromJson(response));

      emit(SimilarBooksSuccess(books: book));
    } on serverException catch (e) {
      emit(SimilarBooksFailure(errMessage: e.errModel.error!.message!));
    }
  }
}
