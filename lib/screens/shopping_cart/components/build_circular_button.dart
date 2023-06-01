import 'package:flutter/material.dart';

class BuildCircularButton extends StatelessWidget {
  const BuildCircularButton({
    Key? key,
    this.height = 30,
    this.width = 30,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  final double height;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double iconSize = height / 2;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
