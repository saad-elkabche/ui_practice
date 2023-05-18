import 'package:flutter/material.dart';

extension decoration on Widget{
  Widget addBox({
    Color color=const Color(0xFFEEEEEE),
    double? borderRudius,
   /* double? height,
    double? width,*/
    EdgeInsetsGeometry padding=const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
    EdgeInsetsGeometry margin=const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
  }){
    return Container(
      padding:padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRudius ?? 0),
      ),
      child: this,
    );
  }
}