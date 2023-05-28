import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key,
      Widget? title,
      List<Widget>? actions,
      bool showBackButton = true})
      : super(
          key: key,
          title: title,
          actions: actions,
          leading: showBackButton
              ? Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.pop();
                      },
                    );
                  },
                )
              : null,
        );
}
