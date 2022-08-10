import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/TeacherModel.dart';

postTeacher(TeacherModel teacher) async{
  var body = {
    "name":teacher.name,
    "degree":teacher.degree,
    "dob":teacher.dob,
    "gender":teacher.gender,
    "email":teacher.email,
    "phoneNo":teacher.phoneNo,
    "currentAddress":teacher.currentAddress,
    "permanentAddress":teacher.permanentAddress,
    "bloodGroup":teacher.bloogGroup,
    "motherTongue":teacher.motherTongue,
    "salary":int.parse(teacher.salary.toString()),
    "status":teacher.status,
    "subject_id":teacher.sub_id,
    "std_id":teacher.std_ids
  };
  await http.post(Uri.parse(apiLink.apilink+"api/admin/teacher"),
    headers: {
    "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
    body:json.encode(body)
  ).then((value) {
  });
}

Future<List<TeacherModel>> getAllTeachers() async{
  List<TeacherModel> teachersList = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allteachers"),);
  var teachers = json.decode(res.body);
  for(var i in teachers){
    TeacherModel teacher  = TeacherModel(i["_id"], i["name"], i["degree"], i["dob"], i["gender"], i["email"], i["phoneNo"].toString(), i["currentAddress"], i["permanentAddress"], i["motherTongue"], i["bloodGroup"], i["salary"].toString(), i["status"]);
    teachersList.add(teacher);
  }
  return teachersList;
}

updateTeacherDetails(TeacherModel teacher) async{
  var body = {
    "name":teacher.name,
    "degree":teacher.degree,
    "dob":teacher.dob,
    "gender":teacher.gender,
    "email":teacher.email,
    "phoneNo":teacher.phoneNo,
    "bloodGroup":teacher.bloogGroup,
    "currentAddress":teacher.currentAddress,
    "permanentAddress":teacher.permanentAddress,
    "motherTongue":teacher.motherTongue,
    "salary":int.parse(teacher.salary.toString()),
    "status":teacher.status,
  };
  await http.put(Uri.parse(apiLink.apilink+"api/admin/teacher-details/${teacher.id}"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
    body:json.encode(body),
  ).then((value){
  });
}

void getTeacher(String id) async{
  await http.get(Uri.parse(apiLink.apilink+"api/admin/teacher/$id"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
  ).then((value) {
  });
}