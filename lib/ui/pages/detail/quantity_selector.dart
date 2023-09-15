import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  QuantitySelector({required this.initialValue, required this.onChanged});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove,size: 14,color: Colors.black),
            onPressed: () {
              setState(() {
                if (_quantity > 0) {
                  _quantity--;
                  widget.onChanged(_quantity);
                }
              });
            },
          ),
          Text('$_quantity', style: const TextStyle(fontSize: 14, color: Colors.black)),
          IconButton(
            icon: const Icon(Icons.add,size: 16,color: Colors.black),
            onPressed: () {
              setState(() {
                _quantity++;
                widget.onChanged(_quantity);
              });
            },
          ),
        ],
      ),
    );
  }
}
