import 'package:space_x_book/data/index.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/generated/l10n.dart';
import 'package:space_x_book/util/index.dart';

class GatewayHighlightService implements HighlightService {
  GatewayHighlightService(this._gateway, this._factory);

  final HighlightGateway _gateway;
  final Factory<HighlightDTO, Highlight> _factory;

  @override
  Future<List<Highlight>> getAllHighlights() async {
    final result = await _gateway.getHighLights();
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
