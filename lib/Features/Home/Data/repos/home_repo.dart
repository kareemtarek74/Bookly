import 'package:bookly/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<ServerException, List<BookModel>>> fetchFeaturedBooks();
}
