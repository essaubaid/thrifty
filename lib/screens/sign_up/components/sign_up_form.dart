import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInputBox(labelText: "Email", hintText: "Enter your Email"),
          const SizedBox(height: 30.0),
          buildInputBox(
            labelText: "Password",
            hintText: "Enter your Password",
            isObscureText: true,
            suffixIcon: Icons.remove_red_eye_outlined,
          ),
          const SizedBox(height: 30.0),
          buildInputBox(labelText: "Full Name", hintText: "Enter your Name"),
        ],
      ),
    );
  }

  Widget buildInputBox({
    required String labelText,
    required String hintText,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
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
            validator: validator,
            onChanged: onChanged,
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
