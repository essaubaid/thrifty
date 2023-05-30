import 'package:flutter/material.dart';
import 'package:thrifty/size_config.dart';

import 'forget_password_panel.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double verticalPadding = getProportionateScreenWidth(28);
    double calculatedHeight =
        screenHeight - appBarHeight - (2 * verticalPadding);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: calculatedHeight,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(18),
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back to Thrifty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(34),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Sign in with your email and password or continue with social login",
              ),
              const SizedBox(height: 50.0),
              SignInForm(),
              // const Spacer(),
              const Expanded(child: SizedBox()),
              ForgetPasswordPanel(
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
