import 'package:flutter/cupertino.dart';

Row customPaddedRowWidget(Widget mainWidget, int customFlex){
  return Row(
    children: [
      Expanded(child: Text("")),
      Expanded(
        flex: customFlex,
        child: mainWidget,
      ),
      Expanded(child: Text(""))
    ],
  );
}