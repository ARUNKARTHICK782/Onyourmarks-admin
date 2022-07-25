import 'package:flutter/material.dart';
import 'package:onyourmarks/Drawer/mainDrawer.dart';
import 'package:onyourmarks/Screens/eventsScreen.dart';
import 'package:onyourmarks/Screens/profileScreen.dart';
import 'package:onyourmarks/Screens/rssScreen.dart';

void main() {
  runApp(MaterialApp(
    home: rssScreen()
  ));
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  static int index=0;
  List<Widget> widgetList=[
    homepage(),
    profileScreen(),
    eventsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return widgetList.elementAt(index);
  }
}


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> drawerList=["Home","Profile","Events"];
  List<Widget> widgetList=[
    homepage(),
    profileScreen(),
    eventsScreen()
  ];
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                DrawerHeader(
                  child: Container(
                    height: 100,
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      child: Container(
                        color: Colors.grey.shade100,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(drawerList.elementAt(index)),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        switch(index){
                          case 0:{
                            setState(() {
                              currentPage=0;
                            });
                            break;
                          }
                          case 1:{
                            setState(() {
                              currentPage=1;
                            });
                            break;
                          }
                          case 2:{
                            setState(() {
                              currentPage=2;
                            });
                          }
                        }
                      },
                    );
                  },
                    itemCount: drawerList.length,
                  ),
                ),
              ],
            ),
          )
      ),
      body:(currentPage==0)?Center(
        child: Text("Hello OnYourMarks"),
      ):widgetList.elementAt(currentPage)
    );
  }
}

