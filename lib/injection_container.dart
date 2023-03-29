import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:space_x_book/assembly/dragon_from_dto.dart';
import 'package:space_x_book/assembly/highlight_from_dto.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/presentation/dragons_page/bloc/dragons_bloc.dart';
import 'package:space_x_book/presentation/highlights_page/bloc/highlights_bloc.dart';
import 'package:space_x_book/routing/index.dart';
import 'package:space_x_book/util/factory.dart';

import 'assembly/json_serializable_converter/serializer.dart';
import 'data/index.dart';

GetIt get _instance => GetIt.instance;

T sl<T extends Object>({
  String? instanceName,
  Object? param1,
  Object? param2,
}) =>
    _instance.call<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

void init() {
  _instance.registerLazySingleton<JsonSerializableConverter>(
    () => JsonSerializableConverter(
      {
        DragonDTO: DragonDTO.fromJsonFactory,
        HighlightDTO: HighlightDTO.fromJsonFactory,
      },
    ),
  );
  _instance.registerLazySingleton(() => AppRouter());
  _instance.registerLazySingleton(
    () => ChopperClient(
      baseUrl: Uri.tryParse('https://api.spacexdata.com/v3'),
      errorConverter: sl<JsonSerializableConverter>(),
      converter: sl<JsonSerializableConverter>(),
    ),
  );
  _instance.registerFactory(() => DragonGateway.create(sl<ChopperClient>()));
  _instance.registerFactory(() => HighlightGateway.create(sl<ChopperClient>()));
  _instance.registerFactory(() => DragonsBloc(sl<GetAllDragons>()));
  _instance.registerFactory(() => HighlightsBloc(sl<GetAllHighlights>()));
  _instance.registerFactory<GetAllHighlights>(() => GetAllHighlights(
        sl<HighlightService>(),
      ));
  _instance.registerFactory(() => GetAllDragons(sl<DragonService>()));
  _instance.registerFactory<DragonService>(() => GatewayDragonService(
        sl<DragonGateway>(),
        sl<Factory<DragonDTO, Dragon>>(),
      ));
  _instance.registerFactory<HighlightService>(() => GatewayHighlightService(
        sl<HighlightGateway>(),
        sl<Factory<HighlightDTO, Highlight>>(),
      ));
  _instance.registerFactory<Factory<DragonDTO, Dragon>>(
    () => DragonFromDTOFactory(),
  );
  _instance.registerFactory<Factory<HighlightDTO, Highlight>>(
    () => HighlightFromDTOFactory(),
  );
}
