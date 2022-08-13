import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/SubjectModel.dart';

import '../models/ExamModel.dart';
getAllExams() async{
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allexams"),);
  var exams = jsonDecode(res.body);
  List<Exam> allExams = [];
  for(var i in exams){
    List<SubjectModel> subjectsList = [];
    List<String> dates = [];
    for(var sub in i["exam_id"]["subjects"]){
      SubjectModel subject = SubjectModel.forStandardScreen(sub["_id"], sub["sub_name"], sub["total_marks"].toString());
      subjectsList.add(subject);
    }
    for(var date in i["exam_id"]["dates"]){
      dates.add(date.toString());
    }
    Exam exam = Exam(i["exam_id"]["_id"], i["exam_id"]["exam_name"],i["exam_id"]["status"],i["std"]["std_name"], dates, subjectsList);
    allExams.add(exam);
  }
  return allExams;
}