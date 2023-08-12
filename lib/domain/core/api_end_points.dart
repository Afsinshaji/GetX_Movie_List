import 'api_key.dart';
import 'package:movie_list_getx/core/strings.dart';


class ApiEndPoints {
  final getMoviesUrl =
      '$kBaseUrl/discover/movie?api_key=$apiKey&page={pagenumber}';
}
