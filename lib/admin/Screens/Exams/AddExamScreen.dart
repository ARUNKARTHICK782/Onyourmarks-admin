import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/components/getExpandedWithFlex.dart';
import 'package:onyourmarks/models/StandardModel.dart';

import '../../../models/SubjectModel.dart';
import '../../apiHandler.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  List<String> allSubjectsName = [];
  List<String> allSubjectIDs = [];
  List<String> allStandardNames = [];
  List<String> subjects = [];
  List<String> dates = [];
  List<String> selectedSubIDs = [];
  List<StandardModel> allStandards = [];
  String firstValue = "";
  String? selectedStandard;
  String selectedSection = "";
  String? v;
  String? s;
  int count = 0;
  bool countFixed = false;
  bool showSection = false;
  bool _loading = true;
  TextEditingController countCtrl = TextEditingController();
  TextEditingController examNameCtrl = TextEditingController();
  List<String> dateCtrls = [];

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
    dates = List.filled(c, " ");
    dateCtrls = List.filled(c,"Select Date");
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
  renderDatePickerWidget(int index){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[
                      Text(dateCtrls.elementAt(index)),
                        IconButton(
                          icon: Icon(CupertinoIcons.calendar),
                          onPressed: (){
                            showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year+2)).then((value) {
                              dateCtrls[index] = value.toString().substring(0,10);
                              setState(() {

                              });
                            });
                          },
                        ),
                      ]
                    ),
                  ],
                ))
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
  getAllStandardNames() async{
    await getAllStandards().then((value) {
      for(var i in value){
        allStandardNames.add(i.std_name.toString());
      }
      setState(() {
        allStandards = value;
      });
    });
  }

  @override
  void initState() {
    fetchAllSubjects().then((v){
      getAllStandardNames();
    });
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
                              controller: examNameCtrl,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Select Standard"),
                            ),
                            DropdownButton<String>(
                                items: allStandardNames.map<DropdownMenuItem<String>>((String e){
                                  return DropdownMenuItem<String>(value:e,child: Text(e));
                                }).toList(),
                                value: selectedStandard,
                                onChanged: (String? v){
                                  setState(() {
                                    selectedStandard = v;
                                  });
                                },
                            )

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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                    color: Colors.grey.shade300,
                    child:  Column(
                      children: [
                          for(int i=0;i<count;i++)
                            renderDatePickerWidget(i),
                      ],
                    ),
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
                    String selectedStandardID = "";
                    await getSubjectId(subjects);
                    for (var element in allStandards) {
                      if(element.std_name.toString() == selectedStandard.toString()){
                        selectedStandardID = element.id.toString();
                        break;
                      }
                    }
                    var body = {
                      "exam_name":examNameCtrl.text,
                      "subjects":selectedSubIDs,
                      "status":"upcoming",
                      "dates":dateCtrls,
                      "std_id":selectedStandardID
                    };
                    await postExam(body).then((v){
                      debugPrint("Posted Exam");
                    });
                    debugPrint("Exam body"+body.toString());
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
