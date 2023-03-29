import 'package:chopper/chopper.dart';

import '../../model/index.dart';

part 'dragon_gateway.chopper.dart';

@ChopperApi(baseUrl: '/dragons')
abstract class DragonGateway extends ChopperService {
  static DragonGateway create(ChopperClient client) => _$DragonGateway(client);

  @Get()
  Future<Response<List<DragonDTO>>> getDragons();
}
