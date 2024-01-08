import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/detail_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bo/article.dart';

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (_, __) => HomePage(), routes: [
    GoRoute(path: "cart", builder: (_, __) => CartPage()),
    GoRoute(
        path: "detail",
        builder: (_, state) => DetailPage(article: state.extra as Article)),
  ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
