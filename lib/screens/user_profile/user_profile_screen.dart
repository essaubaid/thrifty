import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import 'package:thrifty/models/user_model.dart';

import '../../bloc/user_block.dart';
import '../../bloc/user_state.dart';
import '../../size_config.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  late String email;
  late String displayName;

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;

    if (userState is UserLoggedIn) {
      email = userState.user.email;
      displayName = userState.user.displayName ?? "name not added yet";
    } else {
      email = 'Anonymous';
      displayName = 'Unknown';
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "My Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(34),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          UserDetailsPanel(displayName: displayName, email: email),
          const SizedBox(
            height: 20,
          ),
          BuildOptions(
            optionTitle: "My Orders",
            optionSubtitle: "View your orders",
            onTap: () {
              print("ListTile tapped");
            },
          ),
          BuildOptions(
            optionTitle: "Sign Out",
            optionSubtitle: "Log out of your account",
            optionIcon: Icons.logout,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class BuildOptions extends StatelessWidget {
  const BuildOptions({
    Key? key,
    required this.optionTitle,
    this.optionSubtitle,
    this.optionIcon = Icons.arrow_forward_ios,
    required this.onTap,
  }) : super(key: key);

  final String optionTitle;
  final String? optionSubtitle;
  final IconData optionIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            optionTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          optionSubtitle != null
              ? Text(
                  optionSubtitle!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ],
      ),
      trailing: Icon(
        optionIcon,
        color: Colors.grey[500],
        size: 20,
      ),
      onTap: onTap,
    );
  }
}

class UserDetailsPanel extends StatelessWidget {
  const UserDetailsPanel({
    Key? key,
    required this.displayName,
    required this.email,
  }) : super(key: key);

  final String displayName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Image.asset(
            "assets/images/Profile Image.png",
            height: 75,
            width: 75,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                displayName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
