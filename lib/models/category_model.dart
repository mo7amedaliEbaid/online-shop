import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String categoryName;
  final String productCount;
  final String imageUrl;

  const Category({
    required this.categoryName,
    required this.productCount,
    required this.imageUrl,
  });

  static Category fromSnapShot(DocumentSnapshot snap) {
    Category category = Category(
      categoryName: snap['categoryName'],
      productCount: snap['productCount'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  @override
  List<Object?> get props => [categoryName, productCount, imageUrl];
}
