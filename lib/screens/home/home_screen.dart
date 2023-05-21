import 'package:flutter/material.dart';
import 'package:thrifty/screens/home/components/body.dart';
import 'package:thrifty/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
