import 'package:space_x_book/data/index.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/util/factory.dart';

class DragonFromDTOFactory implements Factory<DragonDTO, Dragon> {
  @override
  Dragon create(DragonDTO argument) {
    return Dragon(name: argument.name, photos: argument.photos);
  }
}
