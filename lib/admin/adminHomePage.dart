import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/getMainCards.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:io' show Platform;
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:onyourmarks/admin/screens/CoCurricularPage.dart';
import 'package:onyourmarks/admin/screens/StandardScreen.dart';
import 'package:onyourmarks/admin/screens/dashboard.dart';
import 'package:onyourmarks/admin/screens/studentsScreen.dart';
import 'package:onyourmarks/admin/screens/subjectScreen.dart';
import 'package:onyourmarks/admin/screens/teachersScreen.dart';

import 'customColors.dart';

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
    DashboardAdmin()
  ];
  int pageIndex = 0;

  getDrawerTextColor(){
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromARGB(255, 121, 116, 153),
          //   elevation: 0.0,
          //   iconTheme: IconThemeData(color: Colors.black),
          // ),
          // drawer: Drawer(
          //     backgroundColor: Colors.blue[50],
          //     child: DrawerHeader(
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 150,
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 0;
          //                 });
          //               },
          //               child: Text("Student"),
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 1;
          //                 });
          //               },
          //               child: Text("Teacher"),
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 2;
          //                 });
          //               },
          //               child: Text("Subject"),
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 3;
          //                 });
          //               },
          //               child: Text("Standard"),
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 4;
          //                 });
          //               },
          //               child: Text("Co Curricular"),
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             child: TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   pageIndex = 5;
          //                 });
          //               },
          //               child: Text("Dashboard"),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
          body: Row(
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ColoredBox(
                      color: Color(0xffa6a49f),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 0;
                                    });
                                  },
                                  child: Text("Student",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 1;
                                    });
                                  },
                                  child: Text("Teacher",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 2;
                                    });
                                  },
                                  child: Text("Subject",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 3;
                                    });
                                  },
                                  child: Text("Standard",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 4;
                                    });
                                  },
                                  child: Text("Co Curricular",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 5;
                                    });
                                  },
                                  child: Text("Dashboard",style: TextStyle(color:getDrawerTextColor(),),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: widScreens.elementAt(pageIndex)),

            ],
          )),
    );
  }

  fixWindowSize() async {
    if (!kIsWeb &&
        (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
      await DesktopWindow.setMinWindowSize(const Size(600, 800));
    }
  }

  fixWindowSize2() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      // Some android/ios specific code
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      print("Windows");
    } else {
      // Some web specific code there
    }

    await fixWindowSize();
    // return;
  }

  @override
  void initState() {
    fixWindowSize();
  }
}
