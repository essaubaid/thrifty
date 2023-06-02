import 'package:flutter/material.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import 'components/body.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}
