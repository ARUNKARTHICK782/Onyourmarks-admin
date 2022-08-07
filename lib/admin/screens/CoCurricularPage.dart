import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onyourmarks/apihandler/CCA_APIs.dart';

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
          duration: Duration(seconds: 1),
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


  @override
  void initState() {
    getCCA("62dd3885881d7ff0608758b6");
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
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 50,right:250),
                            child: Container(
                              height: 100,
                              child: Card(
                                elevation: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Name : "),
                                            Text("Class : "),
                                            Text("Section : "),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Activity Name : "),
                                            Text("Activity Type : ")
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
