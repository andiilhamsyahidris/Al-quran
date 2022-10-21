import 'package:alquran/data/models/surah_model.dart';
import 'package:equatable/equatable.dart';

class SurahResponse extends Equatable {
  final List<SurahModel> surahList;

  SurahResponse({required this.surahList});

  factory SurahResponse.fromJson(Map<String, dynamic> json) => SurahResponse(
        surahList: List<SurahModel>.from(
          (json["data"] as List).map((e) => SurahModel.fromJson(e)),
        ),
      );
  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(
          surahList.map((e) => e.toJson()),
        ),
      };
  @override
  List<Object> get props => [surahList];
}
