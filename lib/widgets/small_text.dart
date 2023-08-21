import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;

  const SmallText({Key? key,this.color = Colors.black45,
    required this.text,
    this.size=12,
    this.height=1.2
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Roboto',
        color:color,
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w500
      ),

    );
  }
}
