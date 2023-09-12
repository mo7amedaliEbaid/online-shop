import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/screens/payment/referanceCode.dart';
import 'package:online_shop/screens/payment/visaCard.dart';

import '../../widgets/components.dart';


class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.brown,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.black,
          title: const Text('Payment'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    NavigateTo(context,  VisaCardScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/card.png'),
                          height: 250,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Payment With Card',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    NavigateTo(context, const RefCodeScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage(
                                'assets/images/payment_card.png'
                            ),
                            height: 250),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Payment With Card',
                          style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
