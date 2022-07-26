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