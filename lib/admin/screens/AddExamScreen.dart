import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/appbar.dart';

import '../../apihandler/subjectAPIs.dart';
import '../../models/SubjectModel.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  String _examStatusValue = "Upcoming";
  List<String> allSubjectsName = [];
  List<String> allSubjectIDs = [];
  fetchAllSubjects() async{
    var res = await getAllSubjects();
    for(SubjectModel i in res){
      allSubjectsName.add(i.subName ?? '');
      allSubjectIDs.add(i.id ?? '');
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Column(
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
                        child: Text("Exam Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Exam name"
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
