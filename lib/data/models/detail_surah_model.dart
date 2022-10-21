import 'package:alquran/data/models/ayat_model.dart';
import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:equatable/equatable.dart';

class DetailSurahModel extends Equatable {
  DetailSurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
  });

  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int numberOfAyahs;
  final List<AyatModel> ayahs;

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) =>
      DetailSurahModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"],
        ayahs: List<AyatModel>.from(
          json["ayahs"].map((x) => AyatModel.fromJson(x)),
        ),
      );
  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "numberOfAyahs": numberOfAyahs,
        "ayahs": List<dynamic>.from(
          ayahs.map((e) => e.toJson()),
        )
      };

  DetailSurah toEntity() {
    return DetailSurah(
        number: number,
        name: name,
        englishName: englishName,
        englishNameTranslation: englishNameTranslation,
        revelationType: revelationType,
        numberOfAyahs: numberOfAyahs,
        ayahs: ayahs.map((e) => e.toEntity()).toList());
  }

  @override
  List<Object?> get props => [
        number,
        name,
        englishName,
        englishNameTranslation,
        revelationType,
        numberOfAyahs,
        ayahs
      ];
}
