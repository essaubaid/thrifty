import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'reset_password_form.dart';

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
              const SizedBox(height: 50),
              Text(
                "Reset Password",
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
                "type in your phone number and we will send you a code to reset your password",
                style: TextStyle(
                  color: Color(0xFF888888),
                ),
              ),
              const SizedBox(height: 50.0),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
