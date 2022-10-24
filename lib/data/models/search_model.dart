import 'package:alquran/data/models/surah_model.dart';
import 'package:alquran/domain/entities/search.dart';
import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  const SearchModel({
    required this.text,
    // required this.surah,
    required this.numberInSurah,
  });

  final String text;
  // final List<SurahModel> surah;
  final int numberInSurah;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        text: json["text"],
        // surah: List<SurahModel>.from(
        //     json["surah"].map((x) => SurahModel.fromJson(x))),
        numberInSurah: json["numberInSurah"],
      );
  Map<String, dynamic> toJson() => {
        "text": text,
        // "surah": List<dynamic>.from(
        //   surah.map((e) => e.toJson()),
        // ),
        "numberInSurah": numberInSurah,
      };
  Search toEntity() {
    return Search(
        text: text,
        // surah: surah.map((e) => e.toEntity()).toList(),
        numberInSurah: numberInSurah);
  }

  @override
  List<Object?> get props => [
        text,
        // surah,
        numberInSurah,
      ];
}
