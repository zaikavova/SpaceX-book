import '../model/index.dart';

abstract class DragonService {
  Future<List<Dragon>> getDragons();
}
