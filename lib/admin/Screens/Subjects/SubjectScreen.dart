import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/customColors.dart';
import 'package:onyourmarks/models/SubjectModel.dart';
import '../../Components/getExpandedWithFlex.dart';
import './AddSubjectScreen.dart';
import '../../apiHandler.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  double _crossAxisSpacing = 12, _mainAxisSpacing = 12, _aspectRatio = 1.5;
  int _crossAxisCount = 4;
  List<SubjectModel> allSubjectsMain = [];
  List<SubjectModel> allSubjects = [];
  bool _loading = true;

  implementSearch(String s){
    List<SubjectModel> tempList = [];
    for(var i in allSubjectsMain){
      if(i.subName.toString().toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      allSubjects = tempList;
    });
  }

  @override
  void initState() {
    getAllSubjects().then((value) {
      setState((){
        allSubjectsMain = value;
        allSubjects = value;
        _loading = false;
      });
    });
  }

  renderGridCard(SubjectModel subject){
    return Card(
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 250,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        subject
                            .subName ??
                            '',
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 25,
                            overflow: TextOverflow
                                .ellipsis),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder:
                                      (BuildContext
                                  context) {
                                    return addSubjectdialog(
                                        true,
                                        subject
                                            .subName ??
                                            "",
                                        subject
                                            .totalMarks ??
                                            "",
                                        subject
                                            .id ??
                                            "");
                                  });
                            },
                            icon: Icon(
                                CupertinoIcons
                                    .pen)))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Total Marks : " +
                    (subject
                        .totalMarks ??
                        ''))
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
      body: SingleChildScrollView(
        child:Column(
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
                          child: Text("Subjects",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(6),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 300,
                        color: Colors.grey.shade400,
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
                  getExpandedWithFlex(3)
                ],
              ),
            ),
            (_loading)?Center(child: CircularProgressIndicator(),):Padding(
              padding:
              const EdgeInsets.only(left: 80, right: 80, top: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Wrap(
                      children: [
                        for(int i=0;i<allSubjects.length;i++)
                          renderGridCard(allSubjects.elementAt(i))
                      ],
                    )
                  ),
                ),
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return addSubjectdialog(false, "", "", "");
              });
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
