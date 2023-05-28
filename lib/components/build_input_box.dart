import 'package:flutter/material.dart';
import '../size_config.dart';

class BuildInputBox extends StatelessWidget {
  const BuildInputBox({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.keyboardType,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isObscureText;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
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
            keyboardType: keyboardType,
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
