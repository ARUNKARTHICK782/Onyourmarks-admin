import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TeacherAttendance extends StatefulWidget {
  const TeacherAttendance({Key? key}) : super(key: key);

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: 'SecureCode',
          size: 200,
        ),
      ),
    );
  }
}
