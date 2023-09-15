import 'package:flutter/material.dart';

import '../../../widgets/product_display_list_view.dart';
import '../../../widgets/top_container.dart';



class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          children: [
            TopContainer(searchBarTitle: "Search Product"),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ProductDislpayWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
