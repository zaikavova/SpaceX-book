import 'package:chopper/chopper.dart';
import 'package:space_x_book/data/index.dart';

part 'highlight_gateway.chopper.dart';

@ChopperApi(baseUrl: '/history')
abstract class HighlightGateway extends ChopperService {
  static HighlightGateway create(ChopperClient client) =>
      _$HighlightGateway(client);


  @Get()
  Future<Response<List<HighlightDTO>>> getHighLights();

}
