import 'package:equatable/equatable.dart';

class Ayat extends Equatable {
  Ayat({
    required this.numberInSurah,
    required this.text,
  });

  int numberInSurah;
  String text;

  @override
  List<Object> get props => [numberInSurah, text];
}
