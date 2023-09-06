import 'package:flutter/material.dart';

class PlaceholderDialog extends StatelessWidget {
  final Icon icon;
  final String title;
  final String message;
  final List<Widget> actions;

  const PlaceholderDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 16.0),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(message),
        ],
      ),
      actions: actions,
    );
  }
}
