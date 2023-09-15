import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';



part 'cart_event.dart';

part 'cart_state.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
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
}
