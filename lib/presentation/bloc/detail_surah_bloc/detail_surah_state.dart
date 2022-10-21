part of 'detail_surah_bloc.dart';

abstract class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

class DetailSurahEmpty extends DetailSurahState {}

class DetailSurahLoading extends DetailSurahState {}

class DetailSurahError extends DetailSurahState {
  final String message;
  const DetailSurahError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailSurahHasData extends DetailSurahState {
  final DetailSurah detailSurah;

  const DetailSurahHasData({required this.detailSurah});

  @override
  List<Object> get props => [detailSurah];
}
