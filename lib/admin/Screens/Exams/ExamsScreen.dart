import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Provider/BooleanProvider.dart';
import './AddExamScreen.dart';
import './DetailedExamScreen.dart';
import 'package:provider/provider.dart';
import '../../../models/ExamModel.dart';
import '../../apiHandler.dart';
import '../../CustomColors.dart';
import '../../components/getExpandedWithFlex.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  List<Exam> allExams = [];
  List<Exam> allExamsMain = [];
  bool _loading = true;
  bool _isAllEnabled = true;
  bool _nextpage = false;
  String selectedSortName = "All";
  Exam dataToBePassed = Exam.empty();
  bool? boolProvider = false;



  implementSearch(List<Exam> list,String s){
    if(s.isEmpty){
      setState(() {
        allExams = allExamsMain;
      });
      return;
    }
    List<Exam> tempList = [];
    for(var i in list){
      if(i.exam_name.toString().toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      allExams = tempList;
    });
  }
  sortingExams(String status){
    if(status == "all"){
      setState(() {
        allExams = allExamsMain;
      });
      return;
    }
    List<Exam> tempList = [];
    debugPrint(allExamsMain.toString());
    for(var i in allExamsMain){
      if(i.status.toString() == status){
        tempList.add(i);
      }
    }
    setState(() {
        allExams = tempList;
    });
  }
  BooleanProvider? obj;
  bool color1 = false;
  bool color2 = false;
  bool color3 = false;
  bool color4 = false;

  setColor(bool cond,int i){
    switch(i){
      case 1:
        {
          setState(() {
            color1 = cond;
          });
          break;
        }
      case 2:
        {
          setState(() {
            color2 = cond;
          });
          break;
        }
      case 3:
        {
          setState(() {
            color3 = cond;
          });
          break;
        }
      case 4:{
        setState(() {
          color4 = cond;
        });
        break;
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      (boolProvider ?? false)
          ?DetailedExamScreen(dataToBePassed,obj!)
          :SingleChildScrollView(
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
                          child: Text("Exams",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(6),
                  (_isAllEnabled)?Expanded(
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
                            implementSearch(allExams,s);
                          },
                          decoration: InputDecoration(
                              contentPadding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              suffixIcon: Icon(CupertinoIcons.search,color: secondary,),
                              hintText: "Search Exams",
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey.shade800)
                              // ),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ):Text((selectedSortName == "Finished")?"Completed":selectedSortName,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  getExpandedWithFlex(3)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      // hoverColor: (color1)?Colors.red:Colors.green,
                      onHover: (t){
                        setColor(t, 1);
                        // debugPrint(color1.toString());
                      },
                      onTap: () async{
                        await sortingExams("all");
                        setState(() {
                          _isAllEnabled = true;
                          selectedSortName = "All";
                        });
                      },
                      child: Container(
                        color: (color1)?Colors.grey:(selectedSortName == "All")?Colors.grey : Colors.grey.shade300,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text("All")),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onHover: (t){
                        setColor(t, 2);
                      },
                      onTap: () async{
                        setState(() {
                          _isAllEnabled = false;
                          selectedSortName = "Finished";
                        });
                        await sortingExams("finished");
                      },
                      child: Container(
                        color:(color2)?Colors.grey:(selectedSortName == "Finished")?Colors.grey : Colors.grey.shade300,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text("Completed")),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onHover: (t){
                        setColor(t, 3);
                      },
                      onTap: () async{
                        setState(() {
                          _isAllEnabled = false;
                          selectedSortName = "In Progress";
                        });
                        await sortingExams("in progress");
                      },
                      child: Container(
                        color: (color3)?Colors.grey:(selectedSortName == "In Progress")?Colors.grey : Colors.grey.shade300,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text("In Progress")),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onHover: (t){
                        setColor(t, 4);
                      },
                      onTap: () async{
                        setState(() {
                          _isAllEnabled = false;
                          selectedSortName  = "Upcoming";
                        });
                        await sortingExams("upcoming");
                      },
                      child: Container(
                        color: (color4)?Colors.grey.shade300:(selectedSortName == "Upcoming")?Colors.grey : Colors.grey.shade300,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text("Upcoming")),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            (_loading)
                ?Center(child: CircularProgressIndicator(),)
                :Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allExams.length,
                  itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex:4,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        allExams.elementAt(index).exam_name ??
                                            ' ',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)
                                    ),
                                    Text(allExams.elementAt(index).std_id ??
                                        '')
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex:5,child: Container(width: double.infinity,)),
                            Expanded(
                              flex:4,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("From : "+(allExams.elementAt(index).dates?.first.substring(0,10) ?? " ")),
                                    Text("To : "+(allExams.elementAt(index).dates?.last.substring(0,10) ?? " ") )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      dataToBePassed = allExams.elementAt(index);
                      obj?.nextpage = true;
                      boolProvider = obj?.nextpage ?? false;
                    });

                    obj?.addListener(() {
                      setState(() {
                        boolProvider = obj?.nextpage;
                      });
                    });
                    // debugPrint(obj?.hasListeners.toString());
                    debugPrint("In Exam"+(obj?.nextpage.toString() ?? ""));
                  },
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExamScreen(),));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  tempfunc() async{
    await getAllExams().then((v){
      setState(() {
        allExamsMain = v;
        allExams = v;
        _loading = false;
      });
    });
  }

  updateBoolProvider(bool val){
    obj?.nextpage = val;
  }

  @override
  void initState() {
    tempfunc();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      obj = Provider.of<BooleanProvider>(context, listen: false);
    });

  }
}
