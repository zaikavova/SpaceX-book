import 'package:space_x_book/domain/index.dart';

class HighlightsState {
  HighlightsState({required this.isLoading, this.error, this.items});

  final bool isLoading;
  final String? error;
  final List<Highlight>? items;
}
