part of 'detail_surah_bloc.dart';

abstract class DetailSurahEvent {
  const DetailSurahEvent();
}

class FetchSurahDetail extends DetailSurahEvent {
  final int id;
  const FetchSurahDetail(this.id);
}
