import 'package:space_x_book/domain/service/dragon.dart';

import '../model/index.dart';

class GetAllDragons {
  GetAllDragons(this._service);

  final DragonService _service;

  Future<List<Dragon>> call()
  => _service.getDragons();
}
