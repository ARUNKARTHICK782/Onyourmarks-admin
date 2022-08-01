import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/StandardModel.dart';
import 'package:onyourmarks/models/SubjectModel.dart';


postStandard(String standard,String sub1,String sub2,String sub3,String sub4,String sub5) async{
  List<String> subIDs = [];
  subIDs.add(sub1);
  subIDs.add(sub2);
  subIDs.add(sub3);
  subIDs.add(sub4);
  subIDs.add(sub5);
  var body = {
    "subject_id": subIDs,
    "std_name" : standard
  };
  debugPrint("In post standard"+body.toString());
    await http.post(Uri.parse(apiLink.apilink+"api/admin/standard"),
      headers: {
        "content-type":"application/json",
        "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
      },
      body: json.encode(body)
    ).then((value){
      debugPrint(value.body.toString());
    });
}

Future<List<StandardModel>> getAllStandards() async{
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allstandards"));
  var allStandards  = json.decode(res.body);
  List<StandardModel> standardList=[];
  // debugPrint(res.body);
  for(var i in allStandards){

    List<SubjectModel> subList = [];
    for(var subject in i["subject_id"]){
      SubjectModel sub =  SubjectModel.forStandardScreen(subject["_id"].toString(), subject["sub_name"].toString(), subject["total_marks"].toString());
      subList.add(sub);
    }
    StandardModel standardModel = StandardModel(i["_id"], i["std_name"], subList);
    standardList.add(standardModel);
  }
  return standardList;
}