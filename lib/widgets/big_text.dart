import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color color;             // Text color, default is a dark brown
  final String text;             // Text content
  final double size;             // Font size, default is 22
  final TextOverflow overflow;   // Text overflow behavior, default is ellipsis

  // Constructor for the BigText widget
  const BigText({
    Key? key,                    // Key for widget identification
    this.color = const Color(0xff332d2b),  // Default color
    required this.text,           // Required text content
    this.size = 22,               // Default font size
    this.overflow = TextOverflow.ellipsis   // Default overflow behavior
  }) : super(key: key);           // Call the super constructor

  @override
  Widget build(BuildContext context) {
    return Text(
      text,                        // Display the provided text
      overflow: overflow,         // Apply the specified overflow behavior
      style: TextStyle(
        fontFamily: 'Roboto',     // Font family for the text
        color: color,             // Apply the specified text color
        fontSize: size,           // Apply the specified font size
        fontWeight: FontWeight.w600,  // Apply font weight (semi-bold)
      ),
    );
  }
}
