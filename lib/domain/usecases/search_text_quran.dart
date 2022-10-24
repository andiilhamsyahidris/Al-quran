import 'package:alquran/common/failure.dart';
import 'package:alquran/domain/entities/search.dart';
import 'package:alquran/domain/repositories/surah_repository.dart';
import 'package:dartz/dartz.dart';

class SearchTextQuran {
  final SurahRepository repository;

  const SearchTextQuran(this.repository);

  Future<Either<Failure, List<Search>>> execute(String keyword) {
    return repository.searchTextQuran(keyword);
  }
}
