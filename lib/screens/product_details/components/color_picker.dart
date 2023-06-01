import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final List<String> availableColors;
  final String selectedColor;
  final ValueChanged<String> onColorSelected;

  ColorPicker({
    required this.availableColors,
    required this.selectedColor,
    required this.onColorSelected,
    Key? key,
  })  : assert(availableColors.isNotEmpty),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // adjust this height to suit your layout
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onColorSelected(availableColors[index]),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _colorFromHex(availableColors[index]),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == availableColors[index]
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
