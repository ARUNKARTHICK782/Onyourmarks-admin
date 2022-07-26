import 'package:flutter/material.dart';

Expanded getExpandedWithFlex(int flex){
  return Expanded(
      flex: flex,
      child: Container(width: double.infinity,));
}