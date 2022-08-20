import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Components/appbar.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:onyourmarks/admin/Provider/BooleanProvider.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:onyourmarks/admin/Screens/Attendance.dart';
import 'package:onyourmarks/admin/TeacherAttendace.dart';
import 'package:onyourmarks/admin/responsive.dart';
import 'dart:io' show Platform;

import 'Screens/CoCurricular/CoCurricularPage.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Events/EventsScreen.dart';
import 'Screens/Exams/ExamsScreen.dart';
import 'Screens/Standards/StandardScreen.dart';
import 'Screens/Student/StudentsScreen.dart';
import 'Screens/Subjects/SubjectScreen.dart';
import 'Screens/Teachers/TeachersScreen.dart';


class adminHomePage extends StatefulWidget {
  const adminHomePage({Key? key}) : super(key: key);

  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {
  List<Widget> widScreens = [
    studentsScreen(),
    teachersScreen(),
    SubjectScreen(),
    StandardScreen(),
    CoCurricularPage(),
    DashboardAdmin(),
    EventsScreen(),
    ExamsScreen(),
    Attendance(),
    TeacherAttendance()
  ];
  int pageIndex = 0;
  int selectedIndex = 0;
  BooleanProvider? obj;
  getDrawerTextColor(){
    return Colors.white;
  }

  populateDrawerChildren(){
    return [
      Container(
        height: 100,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Container(
              color: (pageIndex == 0)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onHover: (v){
                    if(v)
                      debugPrint('Hovered');
                  },
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Text("Student",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 1)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Text("Teacher",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 2)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  child: Text("Subject",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 3)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  child: Text("Standard",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 4)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  child: Text("Co Curricular",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 5)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 5;
                    });
                  },
                  child: Text("Dashboard",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 6)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 6;
                    });
                  },
                  child: Text("Events",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 7)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 7;
                    });
                    obj?.addListener(() {
                      setState(() {
                        obj?.nextpage = false;
                      });
                    });
                  },
                  child: Text("Exams",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 8)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 8;
                    });
                  },
                  child: Text("Attendance",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: (pageIndex == 9)?primary:null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 9;
                    });
                  },
                  child: Text("Teacher Attendance",style: TextStyle(color:getDrawerTextColor(),),),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: (Responsive.isMobile(context))?AppBar():null,
        drawer: (Responsive.isMobile(context))?Drawer(
              backgroundColor: Colors.blue[50],
              child: DrawerHeader(
                child: Column(
                  children:             populateDrawerChildren()
                ),
              )):null,
          body: Row(
            children: [
              (Responsive.isDesktop(context))?SizedBox(
                width: 300,
                child: ColoredBox(
                  color: Color(0xffa6a49f),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: populateDrawerChildren()
                  ),
                ),
              ):Text(""),
              Expanded(child: widScreens.elementAt(pageIndex)),

            ],
          )),
    );
  }

}
