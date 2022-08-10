import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/CoCurricularActivityModel.dart';
import 'package:onyourmarks/models/StudentModel.dart';

getCCA() async{
  List<CoCurricularActivityModel> allCCA = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allcca"),
    headers: {
      "content-type":"application/json"
    }
  );
  var cca = json.decode(res.body.toString());
  for(var i in cca){
    StudentModel studentModel  = new StudentModel.forCCA(i["student_id"]["_id"], i["student_id"]["roll_no"], i["student_id"]["first_name"], i["student_id"]["last_name"]);
    CoCurricularActivityModel coCurricularActivityModel =  new CoCurricularActivityModel(i["_id"], i["activity_name"], i["activity_type"], i["status"], i["startDate"], i["endDate"], i["isVerified"], studentModel,i["student_id"]["std_id"]["std_name"]);
    allCCA.add(coCurricularActivityModel);
  }
  return allCCA;
}
Future<bool> updateCCA(String activity_id,String decision) async{
  var res = await http.put(Uri.parse(apiLink.apilink+"api/admin/activity/$activity_id"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
    body: jsonEncode({"isVerified":decision})
  );
  return (res.body.isEmpty)?false:true;
}