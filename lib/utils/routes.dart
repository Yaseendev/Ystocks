import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/primary_screen.dart';

class Routes {
  static String home = '/';
  static String productsScreen = '/products';
  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const PrimaryScreen();
  });
  // static var productsScreenHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  //   return ProductsScreen();
  // });

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(home, handler: homeHandler);
    // router.define(productsScreen, handler: productsScreenHandler);
  }
}
