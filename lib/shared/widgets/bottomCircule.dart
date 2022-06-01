import 'package:flutter/material.dart';

class BottomCircule extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  final  IconData? icon;

  const BottomCircule({super.key, required this.color, required this.onPressed, this.icon});
 
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: color,
      onPressed: onPressed,
      child: Icon(icon, color: Colors.black54),
      );
  }
}