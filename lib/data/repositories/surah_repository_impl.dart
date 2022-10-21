import 'dart:io';

import 'package:alquran/common/exception.dart';
import 'package:alquran/common/failure.dart';
import 'package:alquran/data/datasources/alquran_remote_data_source.dart';
import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/repositories/surah_repository.dart';
import 'package:dartz/dartz.dart';

class SurahRepositoryImpl implements SurahRepository {
  final AlquranRemoteDataSource remoteDataSource;

  SurahRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Surah>>> getSurahAlquran() async {
    try {
      final result = await remoteDataSource.getSurahAlquran();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DetailSurah>> getDetailSurah(int number) async {
    try {
      final result = await remoteDataSource.getDetailSurah(number);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
