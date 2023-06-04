import 'package:atomic_state/src/atom/burger_atom.dart';
import 'package:atomic_state/src/atom/cart_atom.dart';
import 'package:atomic_state/src/models/product_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../widgets/cart_drawer.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState get scaffoldState => scaffoldKey.currentState!;

    @override
  void initState() {
    super.initState();

    fetchBurgers();
  }
  
  var isLoading = true;
  @override
  Widget build(BuildContext context) {
    final (burgerLength, burgerLoading) = context.select(() => (burgersState.length, burgerLoadingState));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[Container()],
        title: const Text('Burger Store'),
        centerTitle: true,
      ),
      endDrawer: const CartDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: burgerLength,
            itemBuilder: (context, index) {
              var model =  burgersState[index];
              return ProductCard(
                model:model,
                onTap: () {
                  addBurger.setValue(model);
                },
              );
            },
          ),
          if (burgerLoading.value)
            const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          scaffoldState.openEndDrawer();
        },
        child: RxBuilder(
          builder: (context) {
            return badges.Badge(
              badgeContent: Text(cartBurgersState.length.toString()),
              child: const Icon(Icons.shopping_bag_outlined),
            );
          },
        ),
      ),
    );
  }
}
