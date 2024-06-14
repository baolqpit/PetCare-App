import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare_app_management/main.dart';

class Apptext extends StatelessWidget{
  String? content;
  double? textSize;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;


  Apptext({super.key, required this.content, this.textSize, this.color, this.fontWeight, this.fontStyle });

  @override
  Widget build(BuildContext context) {
    return Text(content ?? "", style: TextStyle(
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: textSize ?? 16,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal
    ),);
    // TODO: implement build
    throw UnimplementedError();
  }



}