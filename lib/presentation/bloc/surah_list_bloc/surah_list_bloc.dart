import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/usecases/get_surah_alquran.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'surah_list_event.dart';
part 'surah_list_state.dart';

class SurahListBloc extends Bloc<SurahListEvent, SurahListState> {
  final GetSurahAlquran getSurahAlquran;
  SurahListBloc({required this.getSurahAlquran}) : super(SurahListEmpty()) {
    on<FetchSurahList>((event, emit) async {
      emit(SurahListLoading());

      final surahQuranResult = await getSurahAlquran.execute();
      surahQuranResult.fold((failure) {
        emit(SurahListError(failure.message));
      }, (data) {
        emit(SurahListHasData(data));
      });
    });
  }
}
