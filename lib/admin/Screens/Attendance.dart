import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/apiHandler.dart';

import '../../models/AttendanceModel.dart';
import '../CustomColors.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List<AttendanceModel> att = [];
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:40,top: 60,bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex:4,
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 25,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Students Attendance",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                          ),
                        ],
                      ),
                    ),
                    // getExpandedWithFlex(6),
                    // (Responsive.isDesktop(context))?Expanded(flex:3,child: getSearchBar()):Text(""),
                    // getExpandedWithFlex(3)
                  ],
                ),
              ),
              if (_loading) Center(child: CircularProgressIndicator(),) else Padding(padding: EdgeInsets.symmetric(horizontal: 70),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: att.length,
                  itemBuilder: (BuildContext context,int index){
                return Card(
                  elevation: 3,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex:4,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff757471),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:20),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          att.elementAt(index).first_name ?? " "+(att.elementAt(index).last_name ?? ""),
                                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)
                                      ),
                                      Text(att.elementAt(index)
                                          .roll_no ??
                                          ''),
                                      Text(att.elementAt(index).std_name ?? " "),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex:5,child: Container(width: double.infinity,)),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              width: 350,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 6,
                                    width: 300,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    height: 6,
                                    width: ((att.elementAt(index).dates?.length ?? 0) / 10)*100,
                                    color: Colors.green,
                                  )
                                ],
                              )
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
              )
            ],
          )
        ),
    );
  }

  @override
  void initState() {
    getAllStudentsAttendance().then((v){
      setState(() {
        att = v;
        _loading = false;
      });

    });
  }
}
