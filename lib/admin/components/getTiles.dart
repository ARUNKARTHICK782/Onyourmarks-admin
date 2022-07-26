import 'package:flutter/material.dart';

Card getStudentDetailsCard(String title,var value){
  return Card(
    child: Container(
        height: 60,
        child: Row(
          children: [
            Expanded(flex: 4,child: Text(title)),
            Expanded(flex:10,child: Text(value.toString()))
          ],
        )
    ),
  );
}