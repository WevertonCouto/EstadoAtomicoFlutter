import 'package:rx_notifier/rx_notifier.dart';
import '../models/product_model.dart';

// atom
final cartBurgersState = RxList<ProductModel>([]);
final finalValue = RxNotifier<String>('R\$: 0,00');

// actions
final removeBurger = RxNotifier<ProductModel?>(null);
final cleanCart = RxNotifier.action();