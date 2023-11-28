import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors.dart';
import '../../../widgets/cart_product_card.dart';
import '../../../widgets/navigation.dart';
import '../../../widgets/top_container.dart';
import '../../payment/cubit/cubit.dart';
import '../../payment/cubit/states.dart';
import '../../payment/toggle.dart';
import '../../user/user_bloc/user_bloc.dart';
import '../cart_bloc/cart_bloc.dart';




class CartDisplayScreen extends StatelessWidget {
  const CartDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentsStates>(
        listener: (context, paymentstate) {
          if (paymentstate is PaymentReferenceCodeSuccessState) {
            NavigateTo(context, const ToggleScreen());
          }
        },
        builder: (context, paymentstate) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: [
                TopContainer(
                  title: 'Cart',
                  searchBarTitle: "search Product",
                  isSearch: false,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      return Container(
                        padding: EdgeInsets.zero,
                        height: MediaQuery.sizeOf(context).height*.51,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartLoaded) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.cart.totalString,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, userstate) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () async {
                                await PaymentCubit.get(context).getFirstToken(
                                  state.cart.totalString.toString(),
                                  userstate.user.fullName,
                                  userstate.user.fullName,
                                  userstate.user.email,
                                  userstate.user.phoneNumber,
                                );
                                NavigateTo(context, ToggleScreen());

                              },
                              child: Text("Chekout"),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
