import 'package:atomic_state/src/atom/burger_atom.dart';
import 'package:atomic_state/src/atom/cart_atom.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../services/burger_service.dart';

class BurgerReducer extends RxReducer {
  final BurgerService burgerService;

  BurgerReducer(this.burgerService) {
    on(() => [fetchBurgers], _fetchBurgers);
    on(() => [addBurger], _addBurger);
  }

  _fetchBurgers() async {
    burgerLoadingState.setValue(true);
    final result = await burgerService.fetchBurgers();
    burgersState.clear();
    burgersState.addAll(result);
    burgerLoadingState.setValue(false);
  }

  _addBurger() {
    final burger = addBurger.value;
    if (burger != null) cartBurgersState.add(burger);
  }

}