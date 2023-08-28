import 'package:flutter/material.dart';

class ColorDropdown extends StatefulWidget {
  final Map<String, Color> colorMap;
  String selectedColor;
  ValueChanged<String> onColorChanged;

  ColorDropdown({
    required this.colorMap,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  _ColorDropdownState createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: widget.colorMap[widget.selectedColor] ==
                    widget.colorMap[widget.selectedColor]
                    ? Colors.green
                    : Colors.grey,
                width: 2,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Color>(
                  value: widget.colorMap[widget.selectedColor],
                  onChanged: (color) {
                    setState(() {
                      widget.selectedColor = widget.colorMap.keys.firstWhere(
                              (key) => widget.colorMap[key] == color,
                          orElse: () => widget.selectedColor);
                      widget.onColorChanged(widget.selectedColor);
                    });
                  },
                  items: widget.colorMap.values.map((color) {
                    return DropdownMenuItem<Color>(
                      value: color,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: widget.colorMap[widget.selectedColor] == color
                                ? Colors.green
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: widget.colorMap[widget.selectedColor] == color
                            ? Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.check, color: Colors.white, size: 12),
                        )
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class _ColorDropdownState extends State<ColorDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           SizedBox(width: 10),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: widget.colorMap[widget.selectedColor] ==
//                     widget.colorMap[widget.selectedColor]
//                     ? Colors.green
//                     : Colors.grey,
//                 width: 2,
//               ),
//             ),
//             child: DropdownButton<Color>(
//               value: widget.colorMap[widget.selectedColor],
//               onChanged: (color) {
//                 setState(() {
//                   widget.selectedColor = widget.colorMap.keys.firstWhere(
//                           (key) => widget.colorMap[key] == color,
//                       orElse: () => widget.selectedColor);
//                   widget.onColorChanged(widget.selectedColor);
//                 });
//               },
//               items: widget.colorMap.values.map((color) {
//                 return DropdownMenuItem<Color>(
//                   value: color,
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: color,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: color == widget.colorMap[widget.selectedColor]
//                         ? Icon(Icons.check, color: Colors.white, size: 20)
//                         : null,
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
