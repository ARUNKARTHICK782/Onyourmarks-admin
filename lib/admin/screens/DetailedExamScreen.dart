import 'package:flutter/material.dart';

class DetailedExamScreen extends StatefulWidget {
  final Widget card;
  const DetailedExamScreen(this.card,{Key? key}) : super(key: key);

  @override
  State<DetailedExamScreen> createState() => _DetailedExamScreenState();
}

class _DetailedExamScreenState extends State<DetailedExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.card,
    );
  }
}
