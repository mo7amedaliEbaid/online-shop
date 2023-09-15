import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/product_model.dart';
import 'base_cart_repos.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CartRepository extends BaseCartRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore firestore;

  CartRepository({auth.FirebaseAuth? firebaseAuth, required this.firestore})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<void> addtocart({required Product product}) async {
    try {
      await firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("cart")
          .doc()
          .set({
        'name': product.productName,
        'price': product.currentPrice,
        'image': product.productImageUrl,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
