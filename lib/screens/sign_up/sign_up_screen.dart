import 'package:flutter/material.dart';
import 'package:thrifty/components/default_button.dart';

import '../../components/custom_app_bar.dart';
import '../../size_config.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up To Thrifty",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SignUpForm(),
                const SizedBox(
                  height: 100,
                ),
                DefaultButton(text: 'Sign Up', press: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
