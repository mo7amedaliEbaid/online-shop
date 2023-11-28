import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_shop/widgets/messenger.dart';

import '../models/product_model.dart';
import '../modules/cart/cart_bloc/cart_bloc.dart';
import '../modules/products/product_bloc/product_bloc.dart';
import '../core/colors.dart';

class ProductDislpayWidget extends StatefulWidget {
  const ProductDislpayWidget({super.key});

  @override
  State<ProductDislpayWidget> createState() => _ProductDislpayWidgetState();
}

class _ProductDislpayWidgetState extends State<ProductDislpayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoaded) {
          return MasonryGridView.count(
            padding: const EdgeInsets.symmetric(vertical: 10),
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            itemCount: state.products.length,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/product-Detail',
                      arguments: state.products[index]);
                },
                child: singleItemWidget(state.products[index],
                    index == state.products.length - 1 ? true : false),
              );
            },
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }

  Widget singleItemWidget(Product product, bool lastItem) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(1, 1))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                //borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl: product.productImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                child: Text(
                  product.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.currentPrice}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoaded) {
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                              Message(context,
                                  "Product added to cart successfully");
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              size: 20,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    Text(
                      '\$${product.oldPrice}',
                      style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: kRedColor,
                          decorationThickness: 2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height:
              lastItem == true ? MediaQuery.of(context).size.height * 0.5 : 0,
        )
      ],
    );
  }
}
