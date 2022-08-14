import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/components/getExpandedWithFlex.dart';

import '../../apihandler/subjectAPIs.dart';
import '../../models/SubjectModel.dart';
import '../apiHandler.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  List<String> allSubjectsName = [];
  List<String> allSubjectIDs = [];
  List<String> subjects = [];
  List<String> selectedSubIDs = [];
  String firstValue = "";
  String selectedStandard = "";
  String selectedSection = "";
  int count = 0;
  String? v;
  String? s;
  TextEditingController countCtrl = TextEditingController();
  bool countFixed = false;
  bool showSection = false;


  fetchAllSubjects() async{
    var res = await getAllSubjects();
    for(SubjectModel i in res){
      allSubjectsName.add(i.subName ?? '');
      allSubjectIDs.add(i.id ?? '');
    }
    firstValue = allSubjectsName.first;
    setState(() {

    });
  }
  updateSubjectsCount(int c){
    subjects = List.filled(c, " ");
    debugPrint(subjects.toString());
    setState(() {
      count = c;
    });
  }
  renderSubjectWidget(int index){
    return  Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox(
            width: 250,
            child:DropdownButton<String>(
              hint: Text("Select subject"),
              value: (allSubjectsName.contains(subjects.elementAt(index)))?subjects.elementAt(index):firstValue,
              onChanged: (String? newValue){
                setState(() {
                  subjects[index] = newValue!;
                });
              },
              items:allSubjectsName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ),
        ],
      ),
    );
  }
  getSubjectId(List<String> subNames){
    for (String value in subNames) {
      selectedSubIDs.add(allSubjectIDs.elementAt(allSubjectsName.indexOf(value)));
    }
    setState(() {

    });
  }

  @override
  void initState() {
    fetchAllSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
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
                          child: Text("Exam Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(5),
                  Expanded(
                    flex: 4,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.grey.shade400,
                                width: 300,
                                child: TextField(
                              controller: countCtrl,
                              decoration: InputDecoration(
                                  hintText: "No of Subjects",
                                  contentPadding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                border: InputBorder.none
                              ),
                    ),
                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: FloatingActionButton(
                              mini:true,
                                onPressed: (){
                                setState(() {
                                  countFixed = true;
                                });
                                  updateSubjectsCount(int.parse(countCtrl.text));
                            }, child: Icon(Icons.add)),
                          ),
                          (countFixed)
                              ?Padding(
                                padding: const EdgeInsets.all(10),
                                child: FloatingActionButton(
                                  mini: true,
                                onPressed: (){
                                  setState(() {
                                    countCtrl.clear();
                                    count = 0;
                                    countFixed=false;
                                  });
                                }, child: Icon(Icons.cancel)),
                              )
                              :Text("")

                        ],
                      )),
                  getExpandedWithFlex(3)
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  hintText: "Exam name"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:20,left:20,bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.all(10),child: Text("Standard"),),
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
                                    )),
                              ],
                            ),
                            (showSection)?Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(10),child: Text("Section"),),
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
                                        )),
                                  ],
                                )
                              ],
                            ):Text(""),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        for(int i=0;i<count;i++)
                          renderSubjectWidget(i),
                      ],
                    ),
                  ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  onTap: () async{
                    await getSubjectId(subjects);
                  },
                  child: Container(
                    color: primary,
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
