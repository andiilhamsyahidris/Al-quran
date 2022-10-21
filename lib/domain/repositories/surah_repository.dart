import 'package:alquran/common/failure.dart';
import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:dartz/dartz.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<Surah>>> getSurahAlquran();
  Future<Either<Failure, DetailSurah>> getDetailSurah(int number);
}
