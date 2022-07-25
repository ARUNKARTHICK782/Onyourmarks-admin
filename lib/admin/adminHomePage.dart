import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/getMainCards.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:io' show Platform;
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:onyourmarks/admin/screens/studentsScreen.dart';
import 'package:onyourmarks/admin/screens/teachersScreen.dart';


class adminHomePage extends StatefulWidget {
  const adminHomePage({Key? key}) : super(key: key);

  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {
  List<Widget> widScreens = [
    studentsScreen(),
    teachersScreen()
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: DrawerHeader(
            child: Column(
              children: [
                Container(height: 150,),
                Container(
                  height: 60,
                  child: TextButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Text("Student"),
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
                    child: Text("Teacher"),
                  ),
                )
              ],
            ),
          )
        ),
        body: widScreens.elementAt(pageIndex)
      ),
    );
  }
  fixWindowSize() async{
    await DesktopWindow.setMinWindowSize(Size(300, 1000));
  }

  fixWindowSize2() async {

    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      // Some android/ios specific code
    }
    else if (defaultTargetPlatform == TargetPlatform.windows) {
      print("Windows");
    }
    else {
      // Some web specific code there
    }

    await fixWindowSize();
    // return;
  }

  @override
  void initState() {

  }
}
