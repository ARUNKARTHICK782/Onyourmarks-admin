import 'package:flutter/material.dart';
import 'package:onyourmarks/apihandler/standardAPIs/standardAPIs.dart';
import 'package:onyourmarks/apihandler/subject/subjectAPIs.dart';
import 'package:onyourmarks/models/SubjectModel.dart';

import 'appbar.dart';
import 'getExpandedWithFlex.dart';

class AddStandard extends StatefulWidget {
  const AddStandard({Key? key}) : super(key: key);

  @override
  State<AddStandard> createState() => _AddStandardState();
}

class _AddStandardState extends State<AddStandard> {
  String? v;
  String selectedStandard = "";
  String? s1,s2,s3,s4,s5;
  String selectedSubject1 = "";
  String selectedSubject2 = "";
  String selectedSubject3 = "";
  String selectedSubject4 = "";
  String selectedSubject5 = "";
  List<String> allSubjectsName = [];
  List<String> allSubjectIDs = [];
  int noOfSubjects = 5;
  fetchAllSubjects() async{
    var res = await getAllSubjects();
    for(SubjectModel i in res){
      allSubjectsName.add(i.subName ?? '');
      allSubjectIDs.add(i.id ?? '');
    }
    setState(() {

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
              height: 130,
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

  temp() async{
    await showDialog(context: context, builder: (BuildContext context){
      return getNoOfSubjects();
    }) ;
  }


  @override
  void initState() {
    fetchAllSubjects();
    //temp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                    padding: const EdgeInsets.all(60),
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
                              width: 350,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Column(
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
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
                                            value: s1,
                                            onChanged: (value) {
                                              setState(() {
                                                s1 = value;
                                                selectedSubject1 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
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
                              ),
                              Card(
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
                                            value: s2,
                                            onChanged: (value) {
                                              setState(() {
                                                s2 = value;
                                                selectedSubject2 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
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
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
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
                                            value: s3,
                                            onChanged: (value) {
                                              setState(() {
                                                s3 = value;
                                                selectedSubject3 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
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
                              ),
                              Card(
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
                                            value: s4,
                                            onChanged: (value) {
                                              setState(() {
                                                s4 = value;
                                                selectedSubject4 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
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
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
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
                                            value: s5,
                                            onChanged: (value) {
                                              allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
                                              setState(() {
                                                s5 = value;
                                                selectedSubject5 = allSubjectIDs.elementAt(allSubjectsName.indexOf(value!));
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
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(onPressed: () async{
                                  await postStandard(selectedStandard, selectedSubject1, selectedSubject2, selectedSubject3, selectedSubject4, selectedSubject5);
                              }, child: Text("Add")),
                              ElevatedButton(onPressed: (){}, child: Text("Cancel"))
                            ],
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
