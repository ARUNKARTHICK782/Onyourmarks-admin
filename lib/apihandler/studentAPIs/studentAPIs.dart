import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/StudentModel.dart';

Future<List<StudentModel>> getAllStudents() async{
  List<StudentModel> returnStudents = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allstudents"));
  var students = json.decode(res.body);
  for(var i in students){
    StudentModel sm = StudentModel.fromJson(i);
    returnStudents.add(sm);
  }
  return returnStudents;
}

Future<StudentModel> getStudent(String uid) async{
  var res= await http.get(Uri.parse(apiLink.apilink+"api/admin/Student/"));
  var student = json.decode(res.body);
  StudentModel studentModel = StudentModel.fromJson(student);
  return studentModel;
}

postStudent(StudentModel student) async{
  // var body = {
  //   "first_name":student.first_name,
  //   "last_name":student.last_name,
  //   "roll_no":student.roll_no,
  //   ""
  // }
  await http.post(Uri.parse(apiLink.apilink+"api/admin/student"),
    headers: {
      "content-type" : "application/json",
      "x-auth-token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
    },
    body:{}
  );
}