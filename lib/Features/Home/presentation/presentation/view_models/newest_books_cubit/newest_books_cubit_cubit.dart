import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.api) : super(NewestBooksCubitInitial());
  final ApiConsumer api;

  getNewestBook() async {
    try {
      emit(NewestBooksCubitLoading());
      final response = await api.get(
        "/volumes?Filtering=free-ebooks&Sorting=newest &q=programming",
      );

      List<BookModel> book = [];
      book.add(BookModel.fromJson(response));

      emit(NewestBooksCubitSuccess(books: book));
    } on serverException catch (e) {
      emit(NewestBooksCubitFailure(errMessage: e.errModel.error!.message!));
    }
  }
}
