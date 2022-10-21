import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:alquran/domain/usecases/get_detail_surah.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final GetDetailSurah getDetailSurah;

  DetailSurahBloc({required this.getDetailSurah}) : super(DetailSurahEmpty()) {
    on<FetchSurahDetail>((event, emit) async {
      emit(DetailSurahLoading());

      final id = event.id;
      final result = await getDetailSurah.execute(id);

      result.fold((failure) {
        emit(DetailSurahError(failure.message));
      }, (data) {
        emit(DetailSurahHasData(detailSurah: data));
      });
    });
  }
}
