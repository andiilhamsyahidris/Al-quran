import 'package:alquran/data/datasources/alquran_remote_data_source.dart';
import 'package:alquran/data/repositories/surah_repository_impl.dart';
import 'package:alquran/domain/repositories/surah_repository.dart';
import 'package:alquran/domain/usecases/get_detail_surah.dart';
import 'package:alquran/domain/usecases/get_surah_alquran.dart';
import 'package:alquran/domain/usecases/search_text_quran.dart';
import 'package:alquran/presentation/bloc/detail_surah_bloc/detail_surah_bloc.dart';
import 'package:alquran/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:alquran/presentation/bloc/surah_list_bloc/surah_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => SurahListBloc(
      getSurahAlquran: locator(),
    ),
  );
  locator.registerFactory(
    () => DetailSurahBloc(
      getDetailSurah: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchBloc(
      searchTextQuran: locator(),
    ),
  );

  locator.registerLazySingleton(() => GetSurahAlquran(locator()));
  locator.registerLazySingleton(() => GetDetailSurah(locator()));
  locator.registerLazySingleton(() => SearchTextQuran(locator()));

  locator.registerLazySingleton<SurahRepository>(
    () => SurahRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<AlquranRemoteDataSource>(
      () => AlquranRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => Client());
}
