import 'package:flutter/material.dart';
import '../../../components/build_input_box.dart';
import '../../../components/default_button.dart';

class ResetPasswordForm extends StatelessWidget {
  ResetPasswordForm({
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
          const BuildInputBox(
            labelText: "Phone Number",
            hintText: "Enter your phone number",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 35.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DefaultButton(
              text: "Reset",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
