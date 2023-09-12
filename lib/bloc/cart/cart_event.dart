part of 'cart_bloc.dart';

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
