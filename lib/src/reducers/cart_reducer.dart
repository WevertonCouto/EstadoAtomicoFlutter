import 'package:atomic_state/src/atom/burger_atom.dart';
import 'package:atomic_state/src/atom/cart_atom.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CartReducer extends RxReducer {
  CartReducer() {
    on(() => [cleanCart], _cleanCart);
    on(() => [removeBurger], _removeBurger);
    on(() => [cartBurgersState.length], _changeFinalValue);
  }

  _changeFinalValue() {
    final value = cartBurgersState.fold<double>(0.0, (previousValue, element) => element.price + previousValue);
    finalValue.setValue(r'R$' + value.toStringAsFixed(2));
  }

  _cleanCart() {
    cartBurgersState.clear();
  }

  _removeBurger() {
    final burger = removeBurger.value;
    if (burger != null) cartBurgersState.remove(burger);
  }
}