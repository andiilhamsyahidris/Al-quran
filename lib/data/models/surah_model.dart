import 'package:alquran/domain/entities/surah.dart';
import 'package:equatable/equatable.dart';

class SurahModel extends Equatable {
  SurahModel(
      {required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberOfAyahs,
      required this.revelationType,
      required this.number});

  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final int number;

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: json["revelationType"],
        number: json["number"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationType,
        "number": number,
      };
  Surah toEntity() {
    return Surah(
      name: name,
      englishName: englishName,
      englishNameTranslation: englishNameTranslation,
      numberOfAyahs: numberOfAyahs,
      revelationType: revelationType,
      number: number,
    );
  }

  @override
  List<Object?> get props => [
        name,
        englishName,
        englishNameTranslation,
        numberOfAyahs,
        revelationType,
        number
      ];
}
