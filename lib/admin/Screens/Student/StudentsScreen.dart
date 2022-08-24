import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Screens/Student/StudentDashboard.dart';
import 'package:onyourmarks/admin/components/getExpandedWithFlex.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:onyourmarks/admin/responsive.dart';
import './AddStudent.dart';
import './StudentDetails.dart';
import 'package:onyourmarks/models/StudentModel.dart';

import '../../apiHandler.dart';
import '../../apiHandler.dart';

class studentsScreen extends StatefulWidget {
  const studentsScreen({Key? key}) : super(key: key);

  @override
  State<studentsScreen> createState() => _studentsScreenState();
}

class _studentsScreenState extends State<studentsScreen>  {

  final TextEditingController _studentSearchCtrl = TextEditingController();
  List<StudentModel> studentsList =  [];
  List<StudentModel> mainStudentsList = [];
  bool _isloading = true;

  implementSearch(String s){
    List<StudentModel> tempList = [];
    for(var i in mainStudentsList){
      String name = i.first_name.toString()+i.last_name.toString();
      if(name.toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      studentsList = tempList;
    });
  }

  getCard(String text, int index) {
    int height = 50;
    int width = 50;
    bool expanded = false;
    int ind = index - 1;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return AnimatedSize(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: height.toDouble(),
            width: width.toDouble(),
            child: GestureDetector(
              child: Card(
                elevation: 2,
                color:Color.fromARGB(255, 106, 101, 136),
                child: Center(child: Text(text)),
              ),
              onTap: () {
                // setState(() {
                //   _selectedCardIndex = int.parse(text) - 1;
                //   expanded = !expanded;
                //   width = (expanded) ? 100 : 50;
                //   Future.delayed(Duration(milliseconds: 100)).then((value) {
                //     if (expanded)
                //       std = text;
                //     else
                //       std = "1";
                //     getStdWiseCCA(std);
                //   });
                // });
              },
            ),
          ),
        );
      },
    );
  }

  getSearchBar(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 47,
        width: 400,
        color: Colors.grey.shade400,
        child: TextField(
          controller: _studentSearchCtrl,
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
    );
  }
  double elevation = 6;
  int height = 0;
  AnimationController? _controller;

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
                          child: Text("Students",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(8),
                  (Responsive.isDesktop(context))?Expanded(flex:4,child: getSearchBar()):Text(""),
                  getExpandedWithFlex(1)
                ],
              ),
            ),
            (Responsive.isMobile(context))?getSearchBar():Text(""),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       for (int i = 1; i < 13; i++)
                    //         getCard(i.toString(), i),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: (_isloading)?Center(child: CircularProgressIndicator(),)
                          :ClipRRect( //padding with all 50
                            borderRadius: BorderRadius.circular(10),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: studentsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    debugPrint("CLicked");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StudentDashboard(studentsList.elementAt(index))),);
                                  },
                                  child: Container(

                                    height: 80+height.toDouble(),
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
                                                          studentsList.elementAt(index).name ??
                                                              ' ',
                                                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)
                                                      ),
                                                      Text(studentsList.elementAt(index)
                                                          .roll_no ??
                                                          '',style: TextStyle(color: Colors.black),)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(flex:5,child: Container(width: double.infinity,)),
                                          Expanded(
                                            flex:4,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(studentsList.elementAt(index).email ?? " ",style: TextStyle(color: Colors.black),),
                                                  Text(studentsList.elementAt(index).phno.toString(),style: TextStyle(color: Colors.black), )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return Divider(
                                  thickness: 1,
                                );
                              },
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addStudent()));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  void initState() {

    getAllStudents().then((value) {
      setState(() {
        mainStudentsList = value;
        studentsList = value;
        _isloading = false;
      });
    });
  }
}
