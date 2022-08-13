import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/ShowSuccessDialog.dart';
import 'package:onyourmarks/apihandler/standardAPIs.dart';
import 'package:onyourmarks/apihandler/subjectAPIs.dart';
import 'package:onyourmarks/models/SubjectModel.dart';

import '../components/appbar.dart';
import '../components/appbar.dart';
import '../components/getExpandedWithFlex.dart';

class AddStandard extends StatefulWidget {
  const AddStandard({Key? key}) : super(key: key);

  @override
  State<AddStandard> createState() => _AddStandardState();
}

class _AddStandardState extends State<AddStandard> {
  String? v;
  String selectedStandard = "";
   String? s;
  String selectedSection = "";
  List<String> allSubjectsName = [""];
  List<String> allSubjectIDs = [];
  List<String> textConts=[];
  List<String> selectedSubjectIDs=[];
  int noOfSubjects = 0;
  bool showSection = false;
  bool temp = true;
  fetchAllSubjects() async{
    var res = await getAllSubjects();
    for(SubjectModel i in res){
      allSubjectsName.add(i.subName ?? '');
      allSubjectIDs.add(i.id ?? '');
    }
    setState(() {
        temp = false;
    });
  }




  AlertDialog getNoOfSubjects(){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 2,
            child: Container(
              width: 350,
              child:Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("No Of Subjects"),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextField(
                        onChanged: (v){
                          noOfSubjects = int.parse(v);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(3),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          for(int i=0;i<noOfSubjects;i++) {
                            textConts.add("");
                            selectedSubjectIDs.add(" ");
                          }
                          //Navigator.pop(context);
                        }, child: Text("Ok")),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){}, child: Text("Cancel"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
 @override
  void initState() {
    fetchAllSubjects();
    //temp();
  }
  showNoOfSubjectsDialog() async{
    await showDialog(context: context, builder: (BuildContext context){
      return getNoOfSubjects();
    }) ;
  }

  Card getSubject(int index){
    String? s1;
    return  Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text("Subject"),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding:
                const EdgeInsets.only(left: 25),
                child: DropdownButton<String>(
                  value: textConts.elementAt(index),
                  onChanged: (value) {
                    setState(() {
                      s1 = value;
                      selectedSubjectIDs[index] =  allSubjectIDs.elementAt(allSubjectsName.indexOf(s1!)-1);
                      textConts[index]=s1.toString();
                      //selectedSubject1 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
                    });
                  },
                  items: allSubjectsName
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                )),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    (temp)?Future.delayed(Duration.zero, () => showNoOfSubjectsDialog().then((v)=>setState((){}))):null;
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 200),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Card(
                          color: Colors.grey.shade100,
                          elevation: 2,
                          child: Column(children: [
                          Card(
                            elevation: 3,
                            child: Container(
                              height: 130,
                              width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Standard"),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 25),
                                              child: DropdownButton<String>(
                                                value: v,
                                                onChanged: (value) {
                                                  if(["11","12"].contains(value)){
                                                    setState(() {
                                                      showSection = true;
                                                    });
                                                  }
                                                  else{
                                                    setState(() {
                                                      showSection = false;
                                                    });
                                                  }
                                                  setState(() {
                                                    v = value;
                                                    selectedStandard = value!;
                                                  });
                                                },
                                                items: <String>[
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4',
                                                  '5',
                                                  '6',
                                                  '7',
                                                  '8',
                                                  '9',
                                                  '10',
                                                  '11',
                                                  '12'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
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
                                    (showSection)?Expanded(
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
                                    ):Text(""),
                                  ],
                                ),
                              ),
                            ),
                          ),
                            for(int i=0;i<noOfSubjects && !temp;i++)
                                      getSubject(i),
                            Card(
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(onPressed: () async{
                                      String temp;
                                      if(showSection){
                                        temp = selectedStandard+"-"+selectedSection;
                                      }
                                      else{
                                        temp = selectedStandard;
                                      }
                                      await postStandard(temp, selectedSubjectIDs).then((v){
                                        ShowSuccessDialog("Subject added");
                                      });
                                    }, child: Text("Add"))
                                  ],
                                ),
                              ),
                            )

                        ]),
                      ),
                      ),
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
