import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';


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