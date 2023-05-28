import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInputBox(
            labelText: "Email",
            hintText: "Enter your Email",
          ),
          const SizedBox(height: 25.0),
          buildInputBox(
            labelText: "Password",
            hintText: "Enter your password",
            suffixIcon: Icons.remove_red_eye_outlined,
            isObscureText: true,
          ),
          const SizedBox(height: 75.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DefaultButton(
              text: "Sign In",
              press: () {
                context.replaceNamed(RouteConstants.home);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputBox({
    required String labelText,
    required String hintText,
    bool isObscureText = false,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(15),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: TextFormField(
            obscureText: isObscureText,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon != null
                  ? Icon(
                      suffixIcon,
                      color: Colors.grey[500],
                    )
                  : null,
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
              filled: true, // Set to true to enable background color
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Remove the border line
                borderRadius: BorderRadius.circular(
                    10.0), // Customize the border radius if desired
              ),
            ),
          ),
        ),
      ],
    );
  }
}
