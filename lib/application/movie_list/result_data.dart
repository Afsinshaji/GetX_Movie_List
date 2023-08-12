import '../../domain/movie_list/movie_list_model/result.dart';

class ResultData{
  final List<Result>?resultData;
  final bool isError;
  final bool isLoading;
  
ResultData({required this.resultData,required this.isError,required this.isLoading});
}