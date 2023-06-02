import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/screens/user_profile/components/user_details_panel.dart';

import '../../../bloc/user_block.dart';
import '../../../bloc/user_event.dart';
import '../../../bloc/user_state.dart';
import '../../../repository/auth_repo.dart';
import '../../../size_config.dart';
import 'build_options.dart';

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
            onTap: () async {
              await AuthRepository().logout(
                context: context,
              );
              context.goNamed(RouteConstants.signIn);
            },
          )
        ],
      ),
    );
  }
}
