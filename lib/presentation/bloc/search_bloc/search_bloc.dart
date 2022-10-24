import 'package:alquran/domain/entities/search.dart';
import 'package:alquran/domain/usecases/search_text_quran.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTextQuran searchTextQuran;

  SearchBloc({required this.searchTextQuran}) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());

      final result = await searchTextQuran.execute(query);
      result.fold((failure) {
        emit(SearchError(failure.message));
      }, (data) {
        emit(SearchHasData(data));
      });
    });
  }
}
