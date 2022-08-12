import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue[50],
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}
