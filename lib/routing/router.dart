import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/presentation/index.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<dynamic>(page: MainPage),
    AutoRoute<dynamic>(page: DragonsPage),
    AutoRoute<dynamic>(page: HighlightsPage),
    AutoRoute<dynamic>(page: DragonDetailsPage),
  ],
)
class AppRouter extends _$AppRouter {}
