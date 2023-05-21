import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            //width: 1200,
            // height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF979797).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onChanged: (value) {
                // Do something
              },
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search Product Name',
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
