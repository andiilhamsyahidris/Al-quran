import 'package:alquran/common/failure.dart';
import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:alquran/domain/repositories/surah_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailSurah {
  final SurahRepository repository;

  GetDetailSurah(this.repository);

  Future<Either<Failure, DetailSurah>> execute(int number) {
    return repository.getDetailSurah(number);
  }
}
