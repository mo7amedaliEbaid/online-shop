/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/components.dart';
import '../payment/cubit/cubit.dart';
import '../payment/cubit/states.dart';
import '../payment/toggle.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentsStates>(
        listener: (context, state) {
          if(state is PaymentReferenceCodeSuccessState){
            NavigateAndFinish(context, const ToggleScreen());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: const Text('Payment'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/welcome.png"),
                        Row(
                          children: [],
                        ),
                        defaultFormField(
                          controller: firstNameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your First Name';
                            }
                            return null;
                          },
                          label: 'First Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: lastNameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Last Name';
                            }
                            return null;
                          },
                          label: 'Last Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your E-Mail';
                            }
                            return null;
                          },
                          label: 'E-Mail Name',
                          prefix: Icons.mail,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: priceController,
                          type: TextInputType.number,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Price';
                            }
                            return null;
                          },
                          label: 'Price',
                          prefix: Icons.price_check,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                          function: () async {
                            if (formKey.currentState!.validate()) {
                              PaymentCubit.get(context).getFirstToken(
                                  priceController.text,
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  phoneController.text);
                            }
                          },
                          text: "Go To Pay",
                          radius: 12,
                          width: 200,
                          background: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
