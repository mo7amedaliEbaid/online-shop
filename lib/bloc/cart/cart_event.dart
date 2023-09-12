part of 'cart_bloc.dart';

/*
@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);
  @override
  List<Object?> get props => [product];
}

class CartProductRemove extends CartEvent {
  final Product product;

  const CartProductRemove(this.product);
  @override
  List<Object?> get props => [product];
}
*/
abstract class CartEvent extends Equatable{
  const CartEvent();
}

class AddProductToCartEvent extends CartEvent{

  final Product product;
  const AddProductToCartEvent({required this.product});
  @override
  List<Object?> get props => [];
}

class RemoveProductFromCartEvent extends CartEvent{
  final int itemIndex;
  const RemoveProductFromCartEvent(this.itemIndex);

  @override
  List<Object?> get props => [];
}

class ClearCartContentEvent extends CartEvent{
  const ClearCartContentEvent();

  @override
  List<Object?> get props => [];
}

class FetchCartProductsEvent extends CartEvent{
  const FetchCartProductsEvent();

  @override
  List<Object?> get props => [];
}