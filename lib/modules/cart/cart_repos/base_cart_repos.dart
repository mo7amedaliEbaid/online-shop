import '../../../models/product_model.dart';

abstract class BaseCartRepository {
  Future<void> addtocart({
    required Product product,
  });
}
