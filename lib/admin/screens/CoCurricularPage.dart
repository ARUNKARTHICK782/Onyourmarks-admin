import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/apihandler/CCA_APIs.dart';
import 'package:onyourmarks/models/CoCurricularActivityModel.dart';

class CoCurricularPage extends StatefulWidget {
  const CoCurricularPage({Key? key}) : super(key: key);

  @override
  State<CoCurricularPage> createState() => _CoCurricularPageState();
}

class _CoCurricularPageState extends State<CoCurricularPage> {
  List<CoCurricularActivityModel> allCAA=[];
  List<CoCurricularActivityModel> pendingCCA=[];
  List<CoCurricularActivityModel> rejectedCCA = [];
  List<CoCurricularActivityModel> acceptedCCA = [];
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

  getAllCCA() async{
    for (var value in await getCCA()) {
      if(value.isVerified == "pending"){
        allCAA.add(value);
      }
      else if(value.isVerified == "rejected"){
        allCAA.add(value);
      }
      else{
        allCAA.add(value);
      }
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getAllCCA();
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for(int i=1;i<13;i++)
                            getCard(i.toString()),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: allCAA.length,
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
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Name : "+ (allCAA.elementAt(index).student?.name ?? " ")),
                                            Text("Class : "+allCAA.elementAt(index).std_name.toString()),
                                            Text("Section : "+allCAA.elementAt(index).std_name.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Activity Name : "+allCAA.elementAt(index).activity_name.toString()),
                                            Text("Activity Type : "+allCAA.elementAt(index).activity_type.toString())
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex:2,
                                        child: Padding(
                                      padding: EdgeInsets.all(10),
                                          child: (
                                              allCAA.elementAt(index).isVerified == "accepted")
                                                ?Icon(CupertinoIcons.checkmark_alt_circle_fill)
                                                :(allCAA.elementAt(index).isVerified == "pending")
                                                    ?Icon(CupertinoIcons.exclamationmark)
                                                    :Icon(CupertinoIcons.xmark_circle_fill),
                                    ))
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
