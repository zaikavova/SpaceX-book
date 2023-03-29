import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_book/domain/index.dart';

import 'highlights_state.dart';

//TODO (Volodymyr): extract pagination bloc and refactor
class HighlightsBloc extends Bloc<_HighlightsEvent, HighlightsState> {
  HighlightsBloc(this._getAllHighlights)
      : super(HighlightsState(isLoading: true)) {
    on<_FetchAllHighlights>(_refresh);
    refresh();
  }

  final GetAllHighlights _getAllHighlights;

  void refresh() {
    add(_FetchAllHighlights());
  }

  Future<void> _refresh(
    _FetchAllHighlights _,
    Emitter<HighlightsState> emit,
  ) async {
    emit(HighlightsState(isLoading: true));

    try {
      emit(
        HighlightsState(
          isLoading: false,
          items: (await _getAllHighlights()).reversed.toList(),
        ),
      );
    } on Object catch (e) {
      emit(
        HighlightsState(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}

abstract class _HighlightsEvent {}

class _FetchAllHighlights implements _HighlightsEvent {}
