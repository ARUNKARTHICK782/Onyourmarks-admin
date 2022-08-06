import 'dart:math';

import 'package:flutter/material.dart';

class CoCurricularPage extends StatefulWidget {
  const CoCurricularPage({Key? key}) : super(key: key);

  @override
  State<CoCurricularPage> createState() => _CoCurricularPageState();
}

class _CoCurricularPageState extends State<CoCurricularPage> {
  getCard(String text){
    int height = 50;
    int width = 50;
    bool expanded = false;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return  AnimatedSize(
          duration: Duration(milliseconds: 1),
          reverseDuration: Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: height.toDouble(),
            width: width.toDouble(),
            child: GestureDetector(
              child: Card(
                elevation: 2,
                child: Center(child: Text(text)),
              ),
              onTap: (){
                setState((){
                  Future.delayed(Duration(milliseconds: 100)).then((value) {
                      print("After Duration");

                  });
                  expanded = !expanded;
                  width=(expanded) ? 100 : 50;

                });
              },
            ),
          ),
        );
      },
    );
  }
  getDetailsCard(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 50,right:250),
        child: Container(
          height: 80,
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name"),
                      Text("Class"),
                      Text("Section"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text("Activity Name"),
                      Text("Activity Type")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Card(
                child: Container(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          for(int i=1;i<13;i++)
                            getCard(i.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          for(int j=0;j<10;j++)
                            getDetailsCard()
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
