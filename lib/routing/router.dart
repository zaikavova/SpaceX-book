import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  generateForDir: ['lib/presentation'],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: DragonsRoute.page),
        AutoRoute(page: HighlightsRoute.page),
        AutoRoute(page: DragonDetailsRoute.page),
      ];
}
