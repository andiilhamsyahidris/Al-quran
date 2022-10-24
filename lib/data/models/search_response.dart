import 'package:alquran/data/models/search_model.dart';
import 'package:equatable/equatable.dart';

class SearchResponse extends Equatable {
  final List<SearchModel> searchList;

  const SearchResponse({required this.searchList});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        searchList: List<SearchModel>.from(
          (json["matches"] as List).map(
            (e) => SearchModel.fromJson(e),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "matches": List<dynamic>.from(
          searchList.map(
            (e) => e.toJson(),
          ),
        )
      };
  @override
  List<Object> get props => [searchList];
}
