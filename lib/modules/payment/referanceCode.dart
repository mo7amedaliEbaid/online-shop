import 'package:flutter/material.dart';

import '../../core/utils.dart';



class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You Should Go to Any Market To Pay',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 20,
              ),
              Text('This is Refrence Code',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 12,
                shape: Border.all(color: Colors.green,width: 1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$RefCode',style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
