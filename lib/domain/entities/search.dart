import 'package:alquran/domain/entities/surah.dart';
import 'package:equatable/equatable.dart';

class Search extends Equatable {
  Search({
    required this.text,
    // required this.surah,
    required this.numberInSurah,
  });

  String text;
  // List<Surah> surah;
  int numberInSurah;

  @override
  List<Object?> get props => [
        text,
        // surah,
        numberInSurah,
      ];
}
