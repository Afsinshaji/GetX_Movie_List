import 'package:dartz/dartz.dart';

import '../core/failure/main_failure.dart';
import 'movie_list_model/movie_list_model.dart';
abstract class MovieListService{
  Future<Either<MainFailure,MovieListModel>> getMovies({required int pageNum});
}