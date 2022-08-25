import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: allDistricts.length,
                itemBuilder: (BuildContext context,int index){
              return Card(
                child: Container(
                  height: 80,
                  child: Row(
                    children: [
                      Text(allDistricts.elementAt(index).district_name.toString()),
                      Text("0")
                    ],
                  ),
                ),
              );
            }),
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
      });
    });
  }
}
