import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webviewx/webviewx.dart';

import '../../core/utils.dart';
import '../../widgets/navigation.dart';
import '../cart/cart_screens/cart_display_screen.dart';


class VisaCardScreen extends StatefulWidget {
   VisaCardScreen({Key? key}) : super(key: key);

  @override
  State<VisaCardScreen> createState() => _VisaCardScreenState();
}

class _VisaCardScreenState extends State<VisaCardScreen> {
   late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    print("https://accept.paymob.com/api/acceptance/iframes/782045?payment_token=$FinalTokenCard");

      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            InkWell(
              onTap: (){
                exit(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(11.0),
                child: Icon(Icons.exit_to_app,color: Colors.white,),
              ),
            )
          ],
        ),
        body:Center(
          child: WebViewX(
          initialContent: 'https://accept.paymob.com/api/acceptance/iframes/782044?payment_token=$FinalTokenCard',
          initialSourceType: SourceType.url,
              onWebViewCreated: (controller) => webviewController = controller, width: double.infinity, height: double.infinity,

          ),
        ),
      );
  }
  exit(BuildContext context){
    showDialog(
      context: context,
      builder:(_)
    {
      return AlertDialog(
        title: const Text(
          'Are you sure completed payment',
          style: TextStyle(color: Colors.brown, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No"),
          )
        ],
      );
    });
  }

}


