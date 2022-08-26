import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Provider/BooleanProvider.dart';

import '../../../models/ExamModel.dart';
import '../../CustomColors.dart';

class DetailedExamScreen extends StatefulWidget {
  final Exam exam;
  final BooleanProvider obj;
  const DetailedExamScreen(this.exam,this.obj,{Key? key}) : super(key: key);

  @override
  State<DetailedExamScreen> createState() => _DetailedExamScreenState();
}

class _DetailedExamScreenState extends State<DetailedExamScreen> {


  RenderRow(String exam_name,String date){
   return TableRow(
     children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(
               height: 30,
               child: Text(exam_name),
           ),
         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,

         children: [
           SizedBox(
               height: 30,
               child: Text(date)
           ),
         ],
       )
     ]
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Scaffoldall,
      appBar: AppBar(
        backgroundColor: Color(0xffbdb9b9),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            // debugPrint(widget.obj.nextpage.toString());
            setState(() {
              widget.obj.nextpage = false;
              // widget.obj.notifyListeners();
            });
            // debugPrint(widget.obj.nextpage.toString());
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:Column(
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: 80,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex:4,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                widget.exam.exam_name ??
                                    ' ',
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)
                            ),
                            Text(widget.exam.std_id ??
                                '')
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex:5,child: Container(width: double.infinity,)),
                    Expanded(
                      flex:4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("From : "+(widget.exam.dates?.first.substring(0,10) ?? " ")),
                            Text("To : "+(widget.exam.dates?.last.substring(0,10) ?? " ") )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths: <int,TableColumnWidth>{
                0:FlexColumnWidth(),
                1:FlexColumnWidth(),
              },
              children: [
                for(int i=0;i<(widget.exam.subject_id?.length ?? 0);i++)
                  RenderRow((widget.exam.subject_id?.elementAt(i).subName ?? " "),widget.exam.dates?.elementAt(i).substring(0,10) ?? "")
              ],
            ),
          )
        ],
      )
    );
  }

  @override
  void initState() {
    widget.obj.addListener(() {


    });
    debugPrint("Listener in Details"+widget.obj.nextpage.toString());
  }
}
