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
  getDrawerTextColor() {
    return Colors.white;
  }

  getCard(int curr, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        child: Container(
          width: 250,
          height: 43,
          color: (pageIndex == curr) ? Colors.blue[500] : Colors.transparent,
          child: TextButton(
            onPressed: () {
              setState(() {
                pageIndex = curr;
                debugPrint(pageIndex.toString());
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: getDrawerTextColor(),
                  ),
                ),
              ],
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  populateDrawerChildren() {
    List<String> colNames = [
      "Student",
      "Teacher",
      "Subject",
      "Standard",
      "Co Curricular",
      "Dashboard",
      "Events",
      "Exams",
      "Attendance",
      "Teacher Attendance"
    ];
    return [
      Container(
        height: 150,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            for (int i = 0; i < colNames.length; i++) getCard(i, colNames[i]),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Scaffoldall,
          appBar: (Responsive.isMobile(context))
              ? AppBar(
                  title: Text("School Name"),
                  backgroundColor: Colors.blue[100],
                )
              : null,
          drawer: (Responsive.isMobile(context))
              ? Drawer(
                  // backgroundColor: Colors.blue[50],
                  backgroundColor: DrawerColor,
                  child: DrawerHeader(
                    child: Column(children: populateDrawerChildren()),
                  ))
              : null,
          body: Row(
            children: [
              (Responsive.isDesktop(context))
                  ? SizedBox(
                      width: 250,
                      child: ColoredBox(
                        color: DrawerColor ?? Colors.red,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: populateDrawerChildren()),
                      ),
                    )
                  : Text(""),
              Expanded(child: widScreens.elementAt(pageIndex)),
            ],
          )),
    );
  }
}
