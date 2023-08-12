import 'package:get/get.dart';
import 'package:movie_list_getx/application/movie_list/result_data.dart';

import '../../infrastructure/movie_list/movie_list_implementation.dart';
import 'dart:developer';

class MovieListController extends GetxController {
  Rx<ResultData> resultData =
      ResultData(resultData: [], isError: false, isLoading: true).obs;
  Rx<int> pageNum = 0.obs;
  getMovieList() async {
    try {
      pageNum = (pageNum.value + 1).obs;
      if (pageNum > 500) {
        return;
      }
      final response = await MovieListImplementation.instance
          .getMovies(pageNum: pageNum.value);
      resultData.value = response.fold(
          (mainFailure) =>
              ResultData(resultData: [], isError: true, isLoading: false),
          (result) => ResultData(
              resultData: result.results, isError: false, isLoading: false));
      log(resultData.value.isLoading.toString());
    } catch (e) {
      resultData.value =
          ResultData(resultData: [], isError: true, isLoading: false);
    }
  }
}
