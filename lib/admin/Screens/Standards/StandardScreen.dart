import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/models/StandardModel.dart';
import '../../Components/getExpandedWithFlex.dart';
import '../../CustomColors.dart';
import './AddStandardScreen.dart';
import '../../../api/apiHandler.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  List<StandardModel> allStandardMain = [];
  List<StandardModel> allStandard = [];
  bool _loading = true;

  @override
  void initState() {
    getAllStandards().then((v){
      setState(() {
        allStandardMain = v;
        allStandard = v;
        _loading = false;
      });
    });
  }

  implementSearch(String s){
    List<StandardModel> tempList = [];
    for(var i in allStandardMain){
      if(i.std_name.toString().toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      allStandard = tempList;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Scaffoldall,
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
                          child: Text("Standards",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
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
                        color: Searchcolor,
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
            (_loading)?Center(child: CircularProgressIndicator(),):Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: allStandard.length ,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ExpansionTile(
                          collapsedBackgroundColor: Colors.white,
                          title: Container(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    allStandard.elementAt(index)
                                        .std_name ??
                                        " ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index1) {
                                      return SizedBox(
                                        height: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                allStandard.elementAt(index)
                                                    .subjects
                                                    ?.elementAt(index1)
                                                    .subName ??
                                                    "",
                                                style:
                                                TextStyle(fontSize: 20),
                                              ),
                                              Text(
                                                allStandard.elementAt(index)
                                                    .subjects
                                                    ?.elementAt(index1)
                                                    .totalMarks ??
                                                    "",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: allStandard.elementAt(index)
                                        .subjects
                                        ?.length,
                                    shrinkWrap: true,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        // Divider(
                        //   thickness: 2,
                        // )
                      ],
                    );
                  },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddStandard()));
        },
      ),
    );
  }


}
