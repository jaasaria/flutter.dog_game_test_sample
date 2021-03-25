import 'package:flutter/material.dart';

class Dog {
  String name;
  Color? color;
  int affectionLevel = 0;
  int hungyLevel = 5;
  List<String>? favoriteFoods;

  Dog({required this.name});
  Dog.namedOnly(this.name);
}
