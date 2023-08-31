import 'package:flutter/material.dart';

class StatusButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final Function(bool) onPressed;

  StatusButton({
    required this.text,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  _StatusButtonState createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed(!widget.isActive);
      },
      child: Container(
        width: 80,
        height: 24,
        decoration: BoxDecoration(
          color: widget.isActive ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black45, width: 1),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isActive ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}