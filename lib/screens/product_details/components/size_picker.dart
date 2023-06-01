import 'package:flutter/material.dart';

class SizePicker extends StatelessWidget {
  final List<String> availableSizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  const SizePicker(
      {required this.availableSizes,
      required this.selectedSize,
      required this.onSizeSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableSizes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onSizeSelected(availableSizes[index]),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: selectedSize == availableSizes[index]
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                availableSizes[index],
                style: TextStyle(
                  color: selectedSize == availableSizes[index]
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
