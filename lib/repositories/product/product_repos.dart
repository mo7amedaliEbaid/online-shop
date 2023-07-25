import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product_model.dart';
import 'base_product_repos.dart';

class ProductRepos extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepos({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromSnapShot(doc);
      }).toList();
    });
  }
}
