import 'package:space_x_book/data/index.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/generated/l10n.dart';
import 'package:space_x_book/util/index.dart';

class GatewayDragonService implements DragonService {
  final DragonGateway _gateway;
  final Factory<DragonDTO, Dragon> _factory;

  GatewayDragonService(this._gateway, this._factory);

  @override
  Future<List<Dragon>> getDragons() async {
    final result = await _gateway.getDragons();
    final error = result.error;
    final body = result.body;
    if (error != null) {
      throw error;
    } else if (body != null) {
      return body.map(_factory.create).toList();
    }
    throw S.current.somethingWrong;
  }

}
