import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/configs/app.dart';
import 'package:online_shop/configs/configs.dart';
import 'package:online_shop/screens/register/register.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../utils/colors.dart';
import '../../widgets/cart_product_card.dart';
import '../../widgets/components.dart';
import '../../widgets/top_container.dart';
import '../payment/cubit/cubit.dart';
import '../payment/cubit/states.dart';
import '../payment/toggle.dart';

class CartDisplayScreen extends StatelessWidget {
  const CartDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentsStates>(
        listener: (context, paymentstate) {
          if (paymentstate is PaymentReferenceCodeSuccessState) {
            NavigateAndFinish(context, const ToggleScreen());
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
                        height: 400,
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
                  height: 20,
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
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, userstate) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () async {
                               /* Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));*/
                                 await PaymentCubit.get(context).getFirstToken(
                                  state.cart.totalString.toString(),
                                  userstate.user.fullName,
                                  userstate.user.fullName,
                                  userstate.user.email,
                                 "01016381636"
                                 // userstate.user.zipCode,
                                );
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
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
