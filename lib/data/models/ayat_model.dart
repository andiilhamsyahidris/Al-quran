import 'package:alquran/domain/entities/ayat.dart';
import 'package:equatable/equatable.dart';

class AyatModel extends Equatable {
  AyatModel({
    required this.numberInSurah,
    required this.text,
  });

  final int numberInSurah;
  final String text;

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
        numberInSurah: json["numberInSurah"],
        text: json["text"],
      );
  Map<String, dynamic> toJson() => {
        "numberInSurah": numberInSurah,
        "text": text,
      };
  Ayat toEntity() {
    return Ayat(numberInSurah: numberInSurah, text: text);
  }

  @override
  List<Object?> get props => [
        numberInSurah,
        text,
      ];
}
