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