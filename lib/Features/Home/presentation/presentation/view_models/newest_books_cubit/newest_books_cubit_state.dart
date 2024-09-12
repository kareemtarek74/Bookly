part of 'newest_books_cubit_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksCubitInitial extends NewestBooksState {
  const NewestBooksCubitInitial();
}

final class NewestBooksCubitLoading extends NewestBooksState {}

final class NewestBooksCubitSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksCubitSuccess({required this.books});
}

final class NewestBooksCubitFailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksCubitFailure({required this.errMessage});
}
