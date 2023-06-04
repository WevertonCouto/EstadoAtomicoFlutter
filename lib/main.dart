import 'package:atomic_state/src/module.dart';
import 'package:atomic_state/src/reducers/burger_reducer.dart';
import 'package:atomic_state/src/reducers/cart_reducer.dart';
import 'package:atomic_state/src/services/burger_service.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'src/pages/home.dart';

void main() {
  injector.addSingleton(BurgerService.new);
  injector.addSingleton(CartReducer.new);
  injector.addSingleton(BurgerReducer.new);
  injector.commit();

  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        brightness: Brightness.dark,
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
