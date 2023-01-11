import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ios_chatapp/shared/style.dart';

class BoxColumnText extends StatelessWidget {
  final String innerText;
  final bool checkTextIsTitle;

  // ignore: prefer_const_constructors_in_immutables
  BoxColumnText({
    super.key,
    required this.innerText,
    required this.checkTextIsTitle
  });

  @override
  Widget build(BuildContext context) {
    return checkTextIsTitle ?
      Text(innerText, style: customGoogleFonts(0, 0, 0)) 
      : Text(innerText, style: customGoogleFonts(1, 1, 1));
  }

  TextStyle customGoogleFonts(color, size, weight) 
    => GoogleFonts.roboto(color: boxColumnFontColor[color], fontSize: boxColumnFontSize[size], fontWeight: boxColumnFontWeight[weight]);
}
