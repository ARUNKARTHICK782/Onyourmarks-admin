import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
class AttendanceModel{
  String? _id;
  String? _name;
  String? _facultyid;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get facultyid => _facultyid;

  set facultyid(String? value) {
    _facultyid = value;
  }

  AttendanceModel(this._id, this._name, this._facultyid);
}

class TeacherAttendance extends StatefulWidget {
  const TeacherAttendance({Key? key}) : super(key: key);

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  int c =0;
  bool first = true;
  bool loading = true;
  String? date;
  var lastadded;
  Timer?  t ;

  listenFirebase() async{
      await FirebaseFirestore.instance.collection(DateTime.now().toString().substring(0, 10)).snapshots().listen((event) async{
        if(first){
          timerFunc();
          first = false;
          setState(() {

          });
          return;
        }
        lastadded = event.docs.last;
        debugPrint(lastadded.data().toString());
        timerFunc();
        setState(() {
          t?.cancel();
          c=1;
        });
      });
  }


  getNetworkTime() async{
    var res = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
    var dateRes = jsonDecode(res.body);
    return dateRes["datetime"].toString().substring(0,16);
  }

  // timerFunc(){
  //   Timer.periodic(Duration(seconds: 5),(Timer t){
  //     setState(()  async{
  //       date = await getNetworkTime();
  //     });
  //   });
  // }

  setDate() async{
    await getNetworkTime().then((v){
      debugPrint(v.toString());
      setState(() {
        date = v.toString();
        loading = false;
      });
    });


  }

  timerFunc(){
    debugPrint("In timer func");
    Timer.periodic(Duration(seconds: 5),(t) async{
      await setDate();
      if(!mounted) return;
      setState(() {
        if(1==c){
          t.tick;
        }
        c=0;
      });
    });
  }

  @override
  void initState() {
    listenFirebase();
    setDate();

  }

  @override
  void dispose() {
    t?.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Scaffoldall,
          body: (loading)?Center(child: CircularProgressIndicator(),):Center(
        child: (0==c)?QrImage(
          data: date.toString(),
          size: 200,
        ):SizedBox(
          width: 350,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.checkmark_alt_circle,color: Colors.green,size: 40,),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                          child: Text("Name",style: TextStyle(fontSize: 15),),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(lastadded["name"].toString(),style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Faculty ID",style: TextStyle(fontSize: 15),),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(lastadded["facultyId"].toString(),style: TextStyle(fontSize: 15),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
