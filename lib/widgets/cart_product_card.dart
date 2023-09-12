import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../models/product_model.dart';
import '../utils/colors.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      //padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(1, 1))
        ],
      ),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.productImageUrl,
            fit: BoxFit.contain,
            height: 120,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '\$${product.currentPrice}',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  'Size : ${product.productSize}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            color: kGreyColor.withOpacity(0.5),
                            child: Icon(
                              Icons.add,
                              size: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          color: kGreyColor.withOpacity(0.5),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductRemove(product));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            color: kGreyColor.withOpacity(0.5),
                            child: Icon(
                              Icons.remove,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
