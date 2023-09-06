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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
      ),
      //padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove,size: 16),
            onPressed: () {
              setState(() {
                if (_quantity > 0) {
                  _quantity--;
                  widget.onChanged(_quantity);
                }
              });
            },
          ),
          Text('$_quantity'),
          IconButton(
            icon: const Icon(Icons.add,size: 16,),
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
