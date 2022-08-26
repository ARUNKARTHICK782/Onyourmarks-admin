import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/api/apiHandler.dart';

import '../../admin/Components/getExpandedWithFlex.dart';
import '../../admin/CustomColors.dart';
import '../../models/StudentModel.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({Key? key}) : super(key: key);

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {


  List<StudentModel> allStudentsMain = [];
  List<StudentModel> allStudents = [];
  bool _isloading = true;

  implementSearch(String s){
    List<StudentModel> tempList = [];
    for(var i in allStudentsMain){
      String name = i.first_name.toString()+i.last_name.toString();
      if(name.toLowerCase().contains(s.toLowerCase())){
        tempList.add(i);
      }
    }
    setState(() {
      allStudents = tempList;
    });
  }
  getSearchBar(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 47,
        width: 400,
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
    );
  }



  @override
  void initState() {
    getAllStudents().then((v){
      setState(() {
        allStudents = v;
        allStudentsMain = v;
        _isloading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
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
                          child: Text("Students",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(8),
                  getSearchBar(),
                  getExpandedWithFlex(1)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       for (int i = 1; i < 13; i++)
                    //         getCard(i.toString(), i),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: (_isloading)?Center(child: CircularProgressIndicator(),)
                          :ClipRRect( //padding with all 50
                        borderRadius: BorderRadius.circular(10),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: allStudents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              // onTap: () {
                              //   debugPrint("CLicked");
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => StudentDashboard(studentsList.elementAt(index))),);
                              // },
                              child: Container(

                                height: 80,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:4,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Color(0xff757471),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:20),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                      allStudents.elementAt(index).name ??
                                                          ' ',
                                                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)
                                                  ),
                                                  Text(allStudents.elementAt(index)
                                                      .roll_no ??
                                                      '',style: TextStyle(color: Colors.black),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(flex:5,child: Container(width: double.infinity,)),
                                      Expanded(
                                        flex:4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(allStudents.elementAt(index).email ?? " ",style: TextStyle(color: Colors.black),),
                                              Text(allStudents.elementAt(index).phno.toString(),style: TextStyle(color: Colors.black), )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 1,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
