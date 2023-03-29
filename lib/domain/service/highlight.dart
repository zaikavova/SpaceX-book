import 'package:space_x_book/domain/index.dart';

abstract class HighlightService {
  Future<List<Highlight>> getAllHighlights();
}