import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customText(String Name, [Color? col, double? fSize, FontWeight? fwight]) {
  return Text(
    Name,
    style: TextStyle(fontSize: fSize, color: col, fontWeight: fwight),
  );
}
