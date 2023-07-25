
import 'package:equatable/equatable.dart';
import 'package:online_shop/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal => products.fold(
      0, (total, current) => total + double.parse(current.currentPrice));

  String get totalString => subtotal.toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
