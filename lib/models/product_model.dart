import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productName;
  final String productImageUrl;
  final String currentPrice;
  final String productSize;
  final String categoryName;
  final String oldPrice;

  Product({
    required this.productName,
    required this.productImageUrl,
    required this.currentPrice,
    required this.productSize,
    required this.categoryName,
    required this.oldPrice,
  });

  set productSize(String str) {
    productSize = str;
  }

  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
      productName: snap['name'],
      productImageUrl: snap['imageUrl'],
      currentPrice: snap['price'],
      productSize: snap['productSize'],
      categoryName: snap['category'],
      oldPrice: snap['oldprice'],
    );
    return product;
  }

  @override
  List<Object?> get props =>
      [productName, productImageUrl, currentPrice, productSize, categoryName];
}
