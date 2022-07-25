import 'package:flutter/material.dart';

Card getCards(String picname , String title , String subtitle) {
  return Card(
    child: Material(
      borderRadius: BorderRadius.circular(15.0),
      elevation: 5.0,
      child: ListTile(
        leading: Image(
          image: AssetImage(picname),
          height: 56.0,
          width: 56.0,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert),
      ),
    ),
  );
}
