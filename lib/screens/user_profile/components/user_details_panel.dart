import 'package:flutter/material.dart';
import '../../../size_config.dart';

class UserDetailsPanel extends StatelessWidget {
  const UserDetailsPanel({
    Key? key,
    required this.displayName,
    required this.email,
  }) : super(key: key);

  final String displayName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Image.asset(
            "assets/images/Profile Image.png",
            height: 75,
            width: 75,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                displayName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
