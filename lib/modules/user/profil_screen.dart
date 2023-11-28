import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/modules/user/user_bloc/user_bloc.dart';


import '../../core/colors.dart';
import '../../core/utils.dart';
import '../../widgets/main_button_widget.dart';
import '../auth/auth_bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.status == AuthStatus.unauthenticated) {
        return Center(
          child: Mainbutton(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            text: "Login",
            btnColor: kPrimaryColor,
          ),
        );
      }
      return SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://hips.hearstapps.com/hmg-prod/images/sam-worthington-avatar-the-way-of-the-water-1670323169.jpg?crop=0.528xw:1.00xh;0.134xw,0&resize=1200:*',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.user.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: const StadiumBorder(),
                      ),
                      child: Text("Edit Profile"),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileMenuWidget(
                    title: "Settings",
                    icon: FontAwesomeIcons.gear,
                  ),
                  ProfileMenuWidget(
                    title: "Information",
                    icon: FontAwesomeIcons.userCheck,
                  ),
                  ProfileMenuWidget(
                    title: "User Management",
                    icon: FontAwesomeIcons.info,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            builder: (ctxt) {
                              return AlertDialog(
                                  title: Text("Logout"),
                                  content: SizedBox(
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Text("Do you Really want to logout?"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Logout"),
                                              onPressed: () {
                                                context.read<AuthBloc>().add(
                                                    SignOutRequestedEvent());
                                                Navigator.pushNamed(
                                                    context, '/login');
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(
                          color: kPrimaryColor,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: kPrimaryColor,
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.rightFromBracket,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileMenuWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kPrimaryColor.withOpacity(0.2)),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 16,
          ),
        ),
        title: Text(
          title,
          style: kNormalStyle,
        ),
        trailing: Icon(
          FontAwesomeIcons.angleRight,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
