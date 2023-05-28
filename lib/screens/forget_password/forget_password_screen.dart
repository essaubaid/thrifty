import 'package:flutter/material.dart';
import 'package:thrifty/components/custom_app_bar.dart';

import 'components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Body(),
    );
  }
}
