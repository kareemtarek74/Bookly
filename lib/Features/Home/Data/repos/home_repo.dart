import 'package:bookly/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly/core/error/Failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
}
