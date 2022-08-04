import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/SubjectModel.dart';

Future<void>  addSubject(String subname,String totMarks,String standardSec) async{
  debugPrint("In add subject");
  var body = {
    "sub_name": subname+" "+standardSec,
    "total_marks": int.tryParse(totMarks) ?? 100
  };
  await http.post(Uri.parse(apiLink.apilink + "api/admin/subject"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
    },
    body: json.encode(body),
  ).then((value) {
    debugPrint("Subject added");
  });
}


Future<List<SubjectModel>> getAllSubjects() async {
  List<SubjectModel> returnSubjects = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allsubjects"));
  // debugPrint(res.body);
  var subjects = json.decode(res.body);
  for(var i in subjects){
    SubjectModel sm = SubjectModel.fromJson(i);
    returnSubjects.add(sm);
  }
  return returnSubjects;
}


updateSubject(String sub_name,String tot_marks,String id) async{
  var body = {
    "sub_name":sub_name,
    "total_marks":tot_marks
  };
  await http.put(Uri.parse(apiLink.apilink+"api/admin/subject-details/${id}"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
    },
    body: json.encode(body),
  ).then((value){
    debugPrint("Updated subject successfully");
  });
}