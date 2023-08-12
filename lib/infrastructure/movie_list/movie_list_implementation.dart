import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:movie_list_getx/domain/core/api_end_points.dart';
import 'package:movie_list_getx/domain/movie_list/movie_list_model/movie_list_model.dart';
import 'package:movie_list_getx/domain/movie_list/movie_list_service.dart';
import 'package:dio/dio.dart';

import '../../domain/core/failure/main_failure.dart';

class MovieListImplementation extends MovieListService {
  final dio = Dio();
  //single ton
  MovieListImplementation.internal();
  static MovieListImplementation instance = MovieListImplementation.internal();
  MovieListImplementation factory() {
    return instance;
  }

  //
  @override
  Future<Either<MainFailure, MovieListModel>> getMovies(
      {required int pageNum}) async {
    try {
      final url =
          ApiEndPoints().getMoviesUrl.replaceFirst('{pagenumber}', '$pageNum');
      final response = await dio.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieListModel.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
