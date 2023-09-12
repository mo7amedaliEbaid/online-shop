import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

/*class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>((event, emit) {
      emit(CartLoading());
      Future.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    });
    on<CartProductAdded>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..add(event.product))));
      }
    });
    on<CartProductRemove>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..remove(event.product))));
      }
    });
  }
}*/
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitialState()) {
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
    //on<RemoveProductFromCartEvent>(_onRemoveProductFromCartEvent);
    // on<ClearCartContentEvent>(_onClearCartContentEvent);
    //on<FetchCartProductsEvent>(_onFetchCartProductsEvent);
  }

  /* void _onFetchCartProductsEvent(FetchCartProductsEvent event, Emitter<CartState> emitter) {
    // Change the state to LoadingState
    List<CartItem> cartItems = demoCart.products;
    if(cartItems.length >= 0){
      emitter( CartSuccessFetchDataState(cartItems: cartItems));
    }else{
      emitter( const CartErrorFetchDataState(errorMessage: "Something went wrong please try again!"));
    }
  }*/

  void _onAddProductToCartEvent(
      AddProductToCartEvent event, Emitter<CartState> emitter) async {
    // Change the state to LoadingState
    Product product = event.product;
    //demoCart.products.add(event.cartItem);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart")
        .doc()
        .set({
      "name": "yes",
      "price": "10",
    });
    emitter(const CartItemAddedSuccessfulyState(
        successMessage: "Item has been added successfully"));
  }

/* void _onRemoveProductFromCartEvent(RemoveProductFromCartEvent event, Emitter<CartState> emitter) {
    // Change the state to LoadingState
    demoCart.products.removeAt(event.itemIndex);
    emitter(const CartItemRemovedSuccessfulyState(successMessage: "Item has been removed"));
  }*/

/*void _onClearCartContentEvent(ClearCartContentEvent event, Emitter<CartState> emitter) {
    // Change the state to LoadingState
    demoCart.products.clear();
    if(kDebugMode){
      print(demoCart.products.length);
    }
    emitter(const CartContentRemovedSuccessfulyState(successMessage: "Items have been removed"));

  }*/
}
