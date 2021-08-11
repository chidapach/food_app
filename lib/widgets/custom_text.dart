import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:foods/helpers/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  CustomText({
    required this.text,
    required this.size,
    required this.color,
    required this.weight,
  });

  
  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(fontSize: size,
       color: color ,
       fontWeight: weight  
      ),
    );
  }
}