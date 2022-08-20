import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/admin/Screens/Attendance.dart';
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/models/AttendanceModel.dart';
import 'package:onyourmarks/models/CoCurricularActivityModel.dart';
import 'package:onyourmarks/models/EventModel.dart';
import 'package:onyourmarks/models/StudentModel.dart';

import '../models/ExamModel.dart';
import '../models/StandardModel.dart';
import '../models/SubjectModel.dart';
import '../models/TeacherModel.dart';

//GET APIs

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

Future<List<StandardModel>> getAllStandards() async{
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allstandards"));
  var allStandards  = json.decode(res.body);
  List<StandardModel> standardList=[];
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

Future<List<SubjectModel>> getAllSubjects() async {
  List<SubjectModel> returnSubjects = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/allsubjects"));
  var subjects = json.decode(res.body);
  for(var i in subjects){
    SubjectModel sm = SubjectModel.fromJson(i);
    returnSubjects.add(sm);
  }
  return returnSubjects;
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

void getTeacher(String id) async{
  await http.get(Uri.parse(apiLink.apilink+"api/admin/teacher/$id"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
  ).then((value) {
  });
}

getEvents() async{
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/events"));
  var events = jsonDecode(res.body);
  List<EventModel> eventsList = [];
  for(var i in events){
    debugPrint(i["_id"]);
    Uint8List? imgFile =  await FirebaseStorage.instance.ref("Events/").child(i["_id"].toString()).getData();
    EventModel eventModel =  EventModel(i["_id"], i["event_name"], i["event_description"], i["start_date"], i["end_date"],imgFile);
    eventsList.add(eventModel);
  }
  return eventsList;
}

getStudentsGenderWiseCount() async{
  int boysCount = 0;
  int girlsCount = 0;
  var allStudents = await getAllStudents();
  for(var i in allStudents){
    if(i.gender == "Male") {
      boysCount++;
    }
    else if(i.gender == "Female"){
      girlsCount++;
    }
  }
  return [boysCount,girlsCount];
}

getAllStudentsAttendance() async{
  List<AttendanceModel> attendanceList = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/admin/attendance"),
    headers: {
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    }
  );
  debugPrint(res.body);
  var attendance = jsonDecode(res.body);
  for(var i in attendance){
    AttendanceModel att = AttendanceModel(i["_id"], i["student_id"]["first_name"], i["student_id"]["last_name"], i["student_id"]["roll_no"], i["std_id"]["std_name"],i["Dates"]);
    attendanceList.add(att);
  }
  // debugPrint(attendanceList.toString());
  return attendanceList;
}



//POST APIs

postStandard(String standardsec,List<String> subIDs) async{
  var body = {
    "subject_id": subIDs,
    "std_name" : standardsec
  };
  await http.post(Uri.parse(apiLink.apilink+"api/admin/standard"),
      headers: {
        "content-type":"application/json",
        "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
      },
      body: json.encode(body)
  ).then((value){
  });
}

postStudent(var body) async{
  await http.post(Uri.parse(apiLink.apilink+"api/admin/student"),
      headers: {
        "content-type" : "application/json",
        "x-auth-token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q"
      },
      body:jsonEncode(body)
  ).then((value) async{
    // debugPrint(body["roll_no"]);
    await postEmail(body["roll_no"],body["email"]);
  });
}

Future<void>  addSubject(String subname,String totMarks,String standardSec) async{
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
  });
}

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
  ).then((value) async{
    await postEmail(teacher.email.toString(),teacher.email.toString());
  });
}

postNewEvent(String eventName,String eventDescription,String startDate,String endDate,Uint8List bannerImage) async{
  var body = {
    "event_name":eventName,
    "event_description":eventDescription,
    "start_date":startDate,
    "end_date":endDate,
  };
  await http.post(Uri.parse(apiLink.apilink+"api/admin/event"),
    headers: {
      "Content-Type":"application/json",
      // "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
    body: jsonEncode(body)
  ).then((v) async{
    var res = jsonDecode(v.body);
    await FirebaseStorage.instance.ref("Events").child(res["_id"]).putData(bannerImage).then((p0) {
        debugPrint("Image posted");
      });
  });
}

postExam(var body) async{
  var res =await http.post(Uri.parse(apiLink.apilink+"api/admin/exam"),
    headers: {
      "content-type":"application/json",
      "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
    },
    body: jsonEncode(body)
  );
  debugPrint(res.body);
}

postEmail(String username,String email) async{
  var body = {
    "username" : username,
    "type": "REGISTRATION CONFIRMATION",
    "email" : email
  };
  var res = await http.post(Uri.parse(apiLink.apilink+"api/verification/email/creds"),
      headers: {
        "content-type":"application/json",
        "x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRlMGY4ZTY4OTMxMDliNTE3MjMyZTIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NTg3MjAxNDJ9.k8PsqOnry49qkXWC6z3HHx0mlU1Kfi5YouxyJEr7L2Q",
      },
      body: jsonEncode(body)
  ).then((value) {
    debugPrint(value.body.toString());
  });
}

//PUT APIs

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
  });
}
