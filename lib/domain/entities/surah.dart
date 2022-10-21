import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  Surah(
      {required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberOfAyahs,
      required this.revelationType,
      required this.number});

  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyahs;
  String revelationType;
  int number;

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
