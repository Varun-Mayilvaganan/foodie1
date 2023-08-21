import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key,this.color = const Color(0xff332d2b),
    required this.text,
    this.size=22,
    this.overflow=TextOverflow.ellipsis
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color:color,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),

    );
  }
}
