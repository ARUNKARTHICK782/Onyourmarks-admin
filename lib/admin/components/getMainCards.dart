import 'package:flutter/material.dart';

Card getMainCards(String title){
  return Card(
    elevation: 10,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 120,
        width: 120,
        child: Center(
          child: Text(title),
        ),
      ),
    ),
  );
}