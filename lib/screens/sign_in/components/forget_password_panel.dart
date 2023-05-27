import 'package:flutter/material.dart';

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
          const Text(
            'Forgot Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onPress,
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
