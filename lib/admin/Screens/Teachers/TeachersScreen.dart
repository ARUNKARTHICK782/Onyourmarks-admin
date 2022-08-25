import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/TeacherModel.dart';
import '../../Components/getExpandedWithFlex.dart';
import '../../CustomColors.dart';
import '../../../api/apiHandler.dart';
import './UpdateTeacherStandard.dart';
import './AddTeacher.dart';

class teachersScreen extends StatefulWidget {
  const teachersScreen({Key? key}) : super(key: key);

  @override
  State<teachersScreen> createState() => _teachersScreenState();
}

class _teachersScreenState extends State<teachersScreen> {
  List<TeacherModel> allTeachersMain = [];
  List<TeacherModel> allTeachers = [];
  bool _loading = true;

  implementSearch(String s){
    List<TeacherModel> tempList = [];
    for(var i in allTeachersMain){
      if(i.name.toString().toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      allTeachers = tempList;
    });
  }

  @override
  void initState() {
    debugPrint('in init');
    getAllTeachers().then((v){
      setState((){
        allTeachersMain = v;
        allTeachers = v;
        _loading = false;
      });

    });
  }

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
                          child: Text("Teachers",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(8),
                  Expanded(
                    flex: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 47,
                        width: 400,
                        color: Colors.grey.shade400,
                        child: TextField(
                          // controller: _studentSearchCtrl,
                          cursorColor: Colors.grey.shade800,
                          onChanged: (s){
                            implementSearch(s);
                          },
                          decoration: InputDecoration(
                              contentPadding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              suffixIcon: Icon(CupertinoIcons.search,color: secondary,),
                              hintText: "Search",
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey.shade800)
                              // ),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),
                  getExpandedWithFlex(1)
                ],
              ),
            ),
            (_loading)?Center(child: CircularProgressIndicator(),):Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          borderRadius: BorderRadius.circular(5),
                          child: ExpansionTile(
                            collapsedBackgroundColor: Colors.white,
                            textColor: Colors.white,
                            title: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        allTeachers.elementAt(index)
                                            .name ??
                                            " ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(allTeachers.elementAt(index)
                                          .degree ??
                                          "",style:TextStyle(color: Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    getExpandedWithFlex(1),
                                    InkWell(
                                      onTap: ()async{
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddTeacher(
                                                      true,
                                                      allTeachers.elementAt(
                                                          index)
                                                          .id ??
                                                          "",
                                                      name: allTeachers.elementAt(
                                                          index)
                                                          .name ??
                                                          "",
                                                      degree: allTeachers.elementAt(
                                                          index)
                                                          .degree ??
                                                          "",
                                                      email: allTeachers.elementAt(
                                                          index)
                                                          .email ??
                                                          "",
                                                      status:allTeachers.elementAt(
                                                          index)
                                                          .status ??
                                                          "",
                                                      dob: allTeachers.elementAt(
                                                          index)
                                                          .dob ??
                                                          "",
                                                      gender: allTeachers.elementAt(
                                                          index)
                                                          .gender ??
                                                          "",
                                                      salary: allTeachers.elementAt(
                                                          index)
                                                          .salary ??
                                                          "",
                                                      phNo:allTeachers.elementAt(
                                                          index)
                                                          .phoneNo ??
                                                          "",
                                                      curAdd: allTeachers.elementAt(
                                                          index)
                                                          .currentAddress ??
                                                          "",
                                                      perAdd:allTeachers.elementAt(
                                                          index)
                                                          .permanentAddress ??
                                                          "",
                                                      mt: allTeachers.elementAt(
                                                          index)
                                                          .motherTongue ??
                                                          "",
                                                      bg: allTeachers.elementAt(
                                                          index)
                                                          .bloogGroup ??
                                                          "",
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Container(
                                            color: Colors.white,
                                            width: 120,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(child: Text("Update",style: TextStyle(color: Colors.black),)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(1),
                                  ],
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: allTeachers.length),
                  ),)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTeacher(
                        false,
                        "",
                        perAdd: '',
                        salary: '',
                        curAdd: '',
                        gender: '',
                        bg: '',
                        name: '',
                        degree: '',
                        dob: '',
                        phNo: '',
                        email: '',
                        mt: '',
                        status: '',
                      )));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
