import 'package:flutter/material.dart';

class teachersScreen extends StatefulWidget {
  const teachersScreen({Key? key}) : super(key: key);

  @override
  State<teachersScreen> createState() => _teachersScreenState();
}

class _teachersScreenState extends State<teachersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Teachers"),),
    );
  }
}
