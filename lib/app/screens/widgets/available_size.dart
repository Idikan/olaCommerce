import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  const AvailableSize({Key? key, required this.size}) : super(key: key);
  final String size;

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(6),
          width: 50,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red)
          ),
          child: Text(widget.size, style: TextStyle(
            fontWeight: FontWeight.bold, color: isSelected ? Colors.white: Colors.red
          ),),
        ),
      ),
    );
  }
}
