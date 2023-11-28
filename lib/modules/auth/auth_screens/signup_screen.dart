import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/modules/auth/auth_screens/signin_screen.dart';

import '../../../models/user_model.dart';
import '../../../core/colors.dart';
import '../../../core/utils.dart';
import '../../../widgets/main_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../auth_repos/auth_repos.dart';
import '../sign_up_bloc/sign_up_bloc.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String routeName = '/sign-up';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignUpPage(),
    );
  }

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController userCity = TextEditingController();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userCountry = TextEditingController();
  final TextEditingController userAdress = TextEditingController();
  final TextEditingController userPass = TextEditingController();
  final TextEditingController userZipcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpBloc(authRepository: context.read<AuthRepository>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Text(
                  'Create new account',
                  style: kTitleStyle.copyWith(color: kPrimaryColor),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Please fill in the form to continue',
                  style: kNormalStyle.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 50.0),
                textFieldWidget(
                  controller: userName,
                  icon: FontAwesomeIcons.user,
                  keyBordType: TextInputType.name,
                  hintTxt: 'Full Name',
                ),
                textFieldWidget(
                  controller: userEmail,
                  keyBordType: TextInputType.emailAddress,
                  icon: FontAwesomeIcons.user,
                  hintTxt: 'Email ',
                ),
                textFieldWidget(
                  controller: userAdress,
                  icon: FontAwesomeIcons.user,
                  hintTxt: 'Address',
                ),
                textFieldWidget(
                  controller: userCity,
                  icon: FontAwesomeIcons.user,
                  hintTxt: 'City',
                ),
                textFieldWidget(
                  controller: userCountry,
                  icon: FontAwesomeIcons.user,
                  hintTxt: 'Country',
                ),
                textFieldWidget(
                  controller: userZipcode,
                  icon: FontAwesomeIcons.user,
                  hintTxt: 'Phone Number',
                ),
                textFieldWidget(
                  controller: userPass,
                  isObs: true,
                  icon: FontAwesomeIcons.eyeSlash,
                  hintTxt: 'Password',
                ),
                SizedBox(height: 60.0),
                BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state.status == SignUpStatus.success) {
                      showErrorDialog(context, state.error);
                    }
                    if (state.status == SignUpStatus.submitting) {
                      print("submitting");
                    }
                    if (state.status == SignUpStatus.success) {
                      SnackBar(content: Text("login success"));
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  builder: (context, state) {
                    return Mainbutton(
                      onTap: () {
                        User user = User(
                          fullName: userName.text,
                          email: userEmail.text,
                          address: userAdress.text,
                          city: userCity.text,
                          country: userCountry.text,
                          phoneNumber: userZipcode.text,
                        );
                        state.status == SignUpStatus.submitting
                            ? null
                            : context.read<SignUpBloc>().add(
                                SignUpWithCredential(
                                    user: user, password: userPass.text));
                      },
                      text: state.status == SignUpStatus.submitting
                          ? "Wait..."
                          : 'Sign Up',
                      btnColor: kPrimaryColor,
                      txtColor: Colors.white,
                    );
                  },
                ),
                //SizedBox(height: 5.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: kNormalStyle.copyWith(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: kNormalStyle.copyWith(
                          fontSize: 14.0,
                          color: kPrimaryColor,
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
