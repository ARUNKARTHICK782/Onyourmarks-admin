import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/DistrictAdmin/Screens/DistrictSchools.dart';

import '../../admin/Components/getExpandedWithFlex.dart';
import '../../admin/CustomColors.dart';
import '../../api/apiHandler.dart';
import '../../models/DistrictModel.dart';

class DistrictScreen extends StatefulWidget {
  const DistrictScreen({Key? key}) : super(key: key);

  @override
  State<DistrictScreen> createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  bool _loading = true;
  List<DistrictModel> allDistricts = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:40,top: 60,bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text("Schools",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                ),
                getExpandedWithFlex(8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 47,
                    width: 400,
                    color: Colors.grey.shade400,
                    child: TextField(
                      cursorColor: Colors.grey.shade800,
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
                getExpandedWithFlex(1)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex:3,child: Text("Districts")),
                      Expanded(flex:2,child: Text("Schools"))
                    ],
                  ),
                ),
                (_loading)?Center(child:CircularProgressIndicator()):ListView.builder(
                  shrinkWrap: true,
                    itemCount: allDistricts.length,
                    itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DistrictSchools()));
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              flex:4,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            allDistricts.elementAt(index).district_name ??
                                                ' ',
                                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)
                                        ),
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
                                child: Text("1",style: TextStyle(color: Colors.black),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    getAllDistricts().then((v){
      setState(() {
        allDistricts = v;
        _loading = false;
      });
    });
  }
}
