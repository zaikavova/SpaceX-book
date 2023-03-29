import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_book/domain/index.dart';

import 'dragons_state.dart';

//TODO (Volodymyr): extract pagination bloc and refactor
class DragonsBloc extends Bloc<_DragonsEvent, DragonsState> {
  DragonsBloc(this._getAllDragons) : super(DragonsState(isLoading: true)) {
    on<_FetchAllDragons>(_refresh);
    refresh();
  }

  final GetAllDragons _getAllDragons;

  void refresh() {
    add(_FetchAllDragons());
  }

  Future<void> _refresh(
    _FetchAllDragons _,
    Emitter<DragonsState> emit,
  ) async {
    emit(DragonsState(isLoading: true));

    try {
      emit(
        DragonsState(isLoading: false, items: await _getAllDragons()),
      );
    } on Object catch (e) {
      emit(
        DragonsState(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}

abstract class _DragonsEvent {}

class _FetchAllDragons implements _DragonsEvent {}
