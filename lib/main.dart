import 'package:flutter/material.dart';
import 'package:space_x_book/routing/index.dart';

import 'application.dart';
import 'injection_container.dart' as ic;

void main() {
  // Do some SplashScreen job here
  ic.init();
  ic.sl<AppRouter>().push(MainRoute());
  // Run flutter engine
  runApp(const SpaceXBookApplication());
}
