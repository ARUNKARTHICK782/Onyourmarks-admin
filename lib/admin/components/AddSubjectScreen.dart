import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/screens/subjectScreen.dart';

import '../../apihandler/subject/subjectAPIs.dart';
import 'getExpandedWithFlex.dart';


class addSubjectdialog extends StatefulWidget {
  const addSubjectdialog({Key? key}) : super(key: key);

  @override
  State<addSubjectdialog> createState() => _addSubjectdialogState();
}

class _addSubjectdialogState extends State<addSubjectdialog> {
  String? v;
  String? s;

  TextEditingController subjectNameController = new TextEditingController();
  TextEditingController totalMarksController = new TextEditingController();
  String selectedStandard = "";
  String selectedSection = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    height: 130,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Subject Name"),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: subjectNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(3),
                                isDense: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 130,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Marks"),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: totalMarksController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(3),
                                isDense: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 130,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Standard"),
                                SizedBox(height: 25,),
                                Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: DropdownButton<String>(
                                      value: v,
                                      onChanged: (value) {
                                        setState((){
                                          v = value;
                                          selectedStandard = value!;
                                        });
                                      },
                                      items: <String>['1','2','3','4','5','6','7','8','9','10','11','12']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ))
                              ],
                            ),
                          ),
                          getExpandedWithFlex(2),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Section"),
                                SizedBox(height: 25,),
                                Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: DropdownButton<String>(
                                      value: s,
                                      onChanged: (value) {
                                        setState((){
                                          s = value;
                                          selectedSection = value!;
                                        });
                                      },
                                      items: <String>['A','B','C']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      },child: Text("Cancel"),style: ElevatedButton.styleFrom(primary: Colors.red),),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(onPressed: () async{
                        await addSubject(subjectNameController.text,totalMarksController.text,selectedStandard,selectedSection).then((value) async{
                          Navigator.pop(context);

                        });
                      }, child: Text("Save")),

                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}

