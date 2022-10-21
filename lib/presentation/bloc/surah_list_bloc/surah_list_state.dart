part of 'surah_list_bloc.dart';

abstract class SurahListState extends Equatable {
  const SurahListState();

  @override
  List<Object> get props => [];
}

class SurahListEmpty extends SurahListState {}

class SurahListLoading extends SurahListState {}

class SurahListError extends SurahListState {
  final String message;
  const SurahListError(this.message);

  @override
  List<Object> get props => [message];
}

class SurahListHasData extends SurahListState {
  final List<Surah> getSurahQuran;

  const SurahListHasData(
    this.getSurahQuran,
  );

  @override
  List<Object> get props => [
        getSurahQuran,
      ];
}
