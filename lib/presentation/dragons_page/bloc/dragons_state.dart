import 'package:space_x_book/domain/index.dart';

class DragonsState {
  DragonsState({required this.isLoading, this.error, this.items});

  final bool isLoading;
  final String? error;
  final List<Dragon>? items;
}
