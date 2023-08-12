import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'movie_list_model.g.dart';

@JsonSerializable()
class MovieListModel {
  @JsonKey(name: 'results') 
	List<Result>? results;

	MovieListModel({this.results});

	factory MovieListModel.fromJson(Map<String, dynamic> json) {
		return _$MovieListModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}
