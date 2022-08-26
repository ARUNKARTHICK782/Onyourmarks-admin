import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../admin/CustomColors.dart';

class eventsScreen extends StatefulWidget {
  const eventsScreen({Key? key}) : super(key: key);

  @override
  State<eventsScreen> createState() => _eventsScreenState();
}

class _eventsScreenState extends State<eventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Scaffoldall,
      body: Center(
        child: Text("In Events Screen"),
      ),
    );
  }
}
