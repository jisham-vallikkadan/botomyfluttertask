import 'package:flutter/cupertino.dart';

class Headsectionmodeil{
  Color? color;
  IconData? icon;
  String? txt;
  void Function()? click;
  Headsectionmodeil({
    this.color,
    this.txt,
    this.icon,
    required this.click
});
}