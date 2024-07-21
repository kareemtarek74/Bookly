part of 'get_books_cubit.dart';

sealed class GetBooksState extends Equatable {
  const GetBooksState();

  @override
  List<Object> get props => [];
}

final class GetBooksInitial extends GetBooksState {}

final class GetBooksLoading extends GetBooksState {}

final class GetBooksSuccess extends GetBooksState {
  final List<BookModel> books;

  GetBooksSuccess({required this.books});
}

final class GetBooksFailure extends GetBooksState {
  final String errMessage;

  GetBooksFailure({required this.errMessage});
}
