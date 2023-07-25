import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/main_button_widget.dart';

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
                            'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?s=1024x1024&w=is&k=20&c=iX0adGZVKv9wS5yrs0-hpFsJBnRAacZa1DcDZ0I9Bqk=',
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
                    height: 30,
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
                    height: 30,
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
