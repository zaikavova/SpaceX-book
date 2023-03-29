import 'package:space_x_book/domain/index.dart';

class GetAllHighlights {
  final HighlightService _service;

  GetAllHighlights(this._service);

  Future<List<Highlight>> call() => _service.getAllHighlights();
}
