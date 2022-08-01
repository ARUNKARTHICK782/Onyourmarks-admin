import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowSuccessDialog extends StatefulWidget {
  final String content;
  const ShowSuccessDialog(this.content,{Key? key}) : super(key: key);

  @override
  State<ShowSuccessDialog> createState() => _ShowSuccessDialogState();
}

class _ShowSuccessDialogState extends State<ShowSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.content+" successfully"),
          Icon(CupertinoIcons.hand_thumbsup)
        ],
      ),
    );
  }
}
