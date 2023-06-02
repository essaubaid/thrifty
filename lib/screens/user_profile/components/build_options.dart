import 'package:flutter/material.dart';

class BuildOptions extends StatelessWidget {
  const BuildOptions({
    Key? key,
    required this.optionTitle,
    this.optionSubtitle,
    this.optionIcon = Icons.arrow_forward_ios,
    required this.onTap,
  }) : super(key: key);

  final String optionTitle;
  final String? optionSubtitle;
  final IconData optionIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            optionTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          optionSubtitle != null
              ? Text(
                  optionSubtitle!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ],
      ),
      trailing: Icon(
        optionIcon,
        color: Colors.grey[500],
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
