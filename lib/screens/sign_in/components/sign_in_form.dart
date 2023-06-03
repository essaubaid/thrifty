import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/form_submission_status.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:thrifty/screens/sign_in/bloc/sign_in_event.dart';
import 'package:thrifty/screens/sign_in/bloc/sign_in_state.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return buildInputBox(
                labelText: "Email",
                hintText: "Enter your Email",
                validator: (value) =>
                    state.isValidUsername ? null : "Invalid Email",
                onChanged: (value) {
                  context
                      .read<SignInBloc>()
                      .add(SignInUsernameChanged(username: value));
                },
              );
            },
          ),
          const SizedBox(height: 25.0),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return buildInputBox(
                labelText: "Password",
                hintText: "Enter your password",
                suffixIcon: Icons.remove_red_eye_outlined,
                isObscureText: true,
                validator: (value) =>
                    state.isValidPassword ? null : "Invalid Password",
                onChanged: (value) {
                  context
                      .read<SignInBloc>()
                      .add(SignInPasswordChanged(password: value));
                },
              );
            },
          ),
          const SizedBox(height: 75.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return state.formStatus is FormSubmitting
                    ? const CircularProgressIndicator()
                    : DefaultButton(
                        text: "Sign In",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(SignInSubmitted());
                          }
                          // context.replaceNamed(RouteConstants.home);
                        },
                      );
              },
            ),
          ),
          const SizedBox(height: 25.0),
          Center(
            child: GoogleSignInButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignInWithGoogle());
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

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[50],
        child: InkWell(
          splashColor: Colors.red,
          onTap: onPressed,
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
