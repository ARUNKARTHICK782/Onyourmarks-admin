import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xffbdb9b9),
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    title: Text("School Name"),
  );
}
