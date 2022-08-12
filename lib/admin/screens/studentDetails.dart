import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/components/getTiles.dart';
import 'package:onyourmarks/models/StudentModel.dart';

class studentDetails extends StatefulWidget {
  final StudentModel student;
  const studentDetails(this.student,{Key? key}) : super(key: key);

  @override
  State<studentDetails> createState() => _studentDetailsState();
}

class _studentDetailsState extends State<studentDetails> {
  List<String> titles = ["Name","Roll No","Standard","DOB","Gender","Father Name","Mother Name","Occupation","Income","Email","Phone No","Current Address","Permanent Address","Mother Tongue","Blood Group"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Center(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: ListView(
            children: [
              getStudentDetailsCard(titles.elementAt(0),widget.student.name ?? ''),
              getStudentDetailsCard(titles.elementAt(1),widget.student.roll_no ?? ''),
              getStudentDetailsCard(titles.elementAt(2),widget.student.std_id ?? ''),
              getStudentDetailsCard(titles.elementAt(3),widget.student.dob ?? ''),
              getStudentDetailsCard(titles.elementAt(4),widget.student.gender ?? ''),
              getStudentDetailsCard(titles.elementAt(5),widget.student.fatherName ?? ''),
              getStudentDetailsCard(titles.elementAt(6),widget.student.motherName ?? ''),
              getStudentDetailsCard(titles.elementAt(7),widget.student.occupation ?? ''),
              getStudentDetailsCard(titles.elementAt(8),widget.student.income ?? 0),
              getStudentDetailsCard(titles.elementAt(9),widget.student.email ?? ''),
              getStudentDetailsCard(titles.elementAt(10),widget.student.phno ?? 0),
              getStudentDetailsCard(titles.elementAt(11),widget.student.currentAddress ?? ''),
              getStudentDetailsCard(titles.elementAt(12),widget.student.permanentAddress ?? ''),
              getStudentDetailsCard(titles.elementAt(13),widget.student.motherTongue ?? ''),
              getStudentDetailsCard(titles.elementAt(14),widget.student.bloodGroup ?? ''),
            ],
          ),
        ),
        ),
      );
  }
}
