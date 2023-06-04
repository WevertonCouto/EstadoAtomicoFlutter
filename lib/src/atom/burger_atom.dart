import 'package:atomic_state/src/models/product_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

// atoms
final burgersState = RxList<ProductModel>([]);
final burgerLoadingState = RxNotifier(true);

// actions
final fetchBurgers = RxNotifier.action();
final addBurger = RxNotifier<ProductModel?>(null);
