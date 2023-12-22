import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'bo/cart.dart';

void main() {
  //On fournit une instance de Cart à toute
  // notre application
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (_) => Cart(),
  ));
}
