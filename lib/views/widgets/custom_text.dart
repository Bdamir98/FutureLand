import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customTitleText(String Name, [Color? clr, double? fsize]) {
  return Text(
    Name,
    style: TextStyle(fontSize: fsize, color: clr, fontWeight: FontWeight.bold),
  );
}

customSubTitleText(String Name, [Color? clr, double? fsize]) {
  return Text(
    Name,
    style: TextStyle(fontSize: fsize, color: clr, fontWeight: FontWeight.w500),
  );
}
