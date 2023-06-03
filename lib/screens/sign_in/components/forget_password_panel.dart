import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';

class ForgetPasswordPanel extends StatelessWidget {
  const ForgetPasswordPanel({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        // vertical: 10.0,
        horizontal: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pushNamed(RouteConstants.forgotPassword),
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(RouteConstants.signUp),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Color(0xFF3669C9),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
