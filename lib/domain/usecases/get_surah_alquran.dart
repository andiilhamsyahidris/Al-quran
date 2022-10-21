import 'package:alquran/common/failure.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/repositories/surah_repository.dart';
import 'package:dartz/dartz.dart';

class GetSurahAlquran {
  final SurahRepository repository;

  GetSurahAlquran(this.repository);

  Future<Either<Failure, List<Surah>>> execute() {
    return repository.getSurahAlquran();
  }
}
