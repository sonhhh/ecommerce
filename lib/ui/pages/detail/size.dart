import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizeOptions;
  final String selectedSize;
  final void Function(String) onSizeSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const SizeSelector({
    Key? key,
    required this.sizeOptions,
    required this.selectedSize,
    required this.onSizeSelected,
    required this.selectedColor,
    required this.unselectedColor,
  }) : super(key: key);

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizeOptions.map((size) {
        return GestureDetector(
          onTap: () {
            widget.onSizeSelected(size);
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.selectedSize == size ? widget.selectedColor : widget.unselectedColor,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: widget.selectedSize == size ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
