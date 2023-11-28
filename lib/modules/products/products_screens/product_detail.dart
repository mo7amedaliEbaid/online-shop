import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/widgets/messenger.dart';

import '../../../models/product_model.dart';
import '../../../core/colors.dart';
import '../../../core/utils.dart';
import '../../../widgets/indicator.dart';
import '../../cart/cart_bloc/cart_bloc.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({super.key, required this.product});

  static const String routeName = '/product-Detail';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductDetail(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kGreyColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Icon(
                      FontAwesomeIcons.cartShopping,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(),
                      SizedBox(
                        width: 60,
                        height: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: kGreyColor,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.productImageUrl,
                      width: double.maxFinite,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildIndicators(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.productName,
                          style: kNormalStyle.copyWith(
                            color: Colors.black87,
                            fontSize: 20,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$${product.currentPrice}",
                          style: kNormalStyle.copyWith(
                            color: Colors.black87,
                            fontSize: 20,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _availableSize(
                      product: product,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Description",
                      style: kNormalStyle.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "These sizes are commonly used in clothing and are often represented by their respective abbreviations. However, it's important to note that size labels can vary across different brands and regions, so it's always best to consult the specific size charts provided by the manufacturer or retailer to ensure the best fit.",
                      style: kNormalStyle.copyWith(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Message(context, "Product added to cart successfully");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                padding: EdgeInsets.all(15),
              ),
              child: Text("Add to Cart  \$${product.currentPrice}"),
            );
          },
        ),
      ),
    );
  }
}

class _availableSize extends StatefulWidget {
  final Product product;

  const _availableSize({super.key, required this.product});

  @override
  State<_availableSize> createState() => __availableSizeState();
}

class __availableSizeState extends State<_availableSize> {
  Widget _sizeWidget(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.product.productSize = text;
        });
      },
      child: Container(
        width: 70,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.product.productSize != text
                ? kPrimaryColor
                : Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color:
              widget.product.productSize == text ? kPrimaryColor : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: widget.product.productSize == text
                ? Colors.white
                : Colors.black54,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Available Size",
          style: kNormalStyle.copyWith(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _sizeWidget(
                "S",
              ),
              _sizeWidget(
                "M",
              ),
              _sizeWidget(
                "L",
              ),
              _sizeWidget(
                "XL",
              ),
              _sizeWidget(
                "XXL",
              ),
              _sizeWidget(
                "XXXL",
              ),
            ],
          ),
        )
      ],
    );
  }
}
