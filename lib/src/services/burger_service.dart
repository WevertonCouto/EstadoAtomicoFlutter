import '../models/product_model.dart';

class BurgerService {

  Future<List<ProductModel>> fetchBurgers() async {
    await Future.delayed(const Duration(seconds: 3));
    return <ProductModel>[
      ProductModel(id: '0', image: 'assets/burguer.jpg', price: 20, title: 'teste 123'),
      ProductModel(id: '2', image: 'assets/burguer.jpg', price: 20, title: 'teste 456'),
      ProductModel(id: '1', image: 'assets/burguer.jpg', price: 20, title: 'teste 789'),
    ];
  }
}