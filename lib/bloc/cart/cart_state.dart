part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded({this.cart = const Cart()});
  @override
  List<Object?> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object?> get props => [];
}
/*abstract class CartState extends Equatable{
  const CartState();

}

class CartInitialState extends CartState{
  const CartInitialState();

  @override
  List<Object?> get props => [];
}

// Loading state for the Favorite page
class CartLoadingState extends CartState{
  const CartLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the Favorite page
class CartErrorFetchDataState extends CartState{
  final String errorMessage;
  const CartErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
// Success state for the Favorite page
class CartSuccessFetchDataState extends CartState{
  final List<Product> cartItems;

  const CartSuccessFetchDataState({required this.cartItems});
  @override

  List<Object?> get props => [];
}

class CartItemAddedSuccessfulyState extends CartState{
  final String successMessage;
  const CartItemAddedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}

class CartItemRemovedSuccessfulyState extends CartState{
  final String successMessage;
  const CartItemRemovedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}


class CartContentRemovedSuccessfulyState extends CartState{
  final String successMessage;
  const CartContentRemovedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}*/
