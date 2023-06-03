import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:thrifty/screens/sign_up/bloc/sign_up_state.dart';

import '../../../components/default_button.dart';
import '../../../form_submission_status.dart';
import '../../../size_config.dart';
import '../bloc/sign_up_event.dart';

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
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return buildInputBox(
                labelText: "Email",
                hintText: "Enter your Email",
                validator: (value) =>
                    state.isValidEmail ? null : "Invalid Email",
                onChanged: (value) {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpEmailChanged(email: value));
                },
              );
            },
          ),
          const SizedBox(height: 30.0),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return buildInputBox(
                labelText: "Password",
                hintText: "Enter your Password",
                isObscureText: state.isObscure,
                suffixIcon: Icons.remove_red_eye_outlined,
                validator: (value) =>
                    state.isValidPassword ? null : "Invalid Password",
                onChanged: (value) {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpPasswordChanged(password: value));
                },
                suffixOnTap: () {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpIsObscureChanged(isObscure: !state.isObscure));
                },
              );
            },
          ),
          const SizedBox(height: 30.0),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return buildInputBox(
                labelText: "Full Name",
                hintText: "Enter your Name",
                validator: (value) =>
                    state.isValidDisplayName ? null : "Invalid Name",
                onChanged: (value) {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpDisplayNameChanged(displayName: value));
                },
              );
            },
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return state.formStatus is FormSubmitting
                  ? const CircularProgressIndicator()
                  : DefaultButton(
                      text: 'Sign Up',
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignUpBloc>().add(SignUpSubmitted());
                        }
                        // context.replaceNamed(RouteConstants.home);
                      },
                    );
            },
          ),
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
    VoidCallback? suffixOnTap,
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
                  ? GestureDetector(
                      onTap: suffixOnTap,
                      child: Icon(
                        suffixIcon,
                        color: Colors.grey[500],
                      ),
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
