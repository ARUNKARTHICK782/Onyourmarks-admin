import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Screens/Student/StudentDashboard.dart';

import '../../admin/Components/getExpandedWithFlex.dart';
import '../../admin/CustomColors.dart';

class DistrictSchools extends StatefulWidget {
  const DistrictSchools({Key? key}) : super(key: key);

  @override
  State<DistrictSchools> createState() => _DistrictSchoolsState();
}

class _DistrictSchoolsState extends State<DistrictSchools> {

  getCard(String text, int index) {
    int height = 50;
    int width = 50;
    bool expanded = false;
    int ind = index - 1;
    return Column(
      children: [
        StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return AnimatedSize(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: height.toDouble(),
                width: width.toDouble(),
                child: GestureDetector(
                  child: Card(
                    elevation: 2,
                    color: secondary,
                    child: Center(child: Text(text)),
                  ),
                  onTap: () {
                    setState(() {
                      // _selectedCardIndex = int.parse(text) - 1;
                      expanded = !expanded;
                      width = (expanded) ? 100 : 50;
                      // Future.delayed(Duration(milliseconds: 100)).then((value) {
                      //   if (expanded)
                      //     std = text;
                      //   else
                      //     std = "1";
                      //   // getStdWiseCCA(std);
                      // });
                    });
                  },
                ),
              ),
            );
          },
        ),
        placeASizedBoxHere(20)
      ],
    );
  }

  getSchools(){
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey.shade50,
    );
  }

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 25,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Schools",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                          ),

                        ],
                      ),
                      Text("Pune",style: TextStyle(fontSize: 15,),
                      )
                    ],
                  ),
                ),
                getExpandedWithFlex(7),
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
                          hintText: "Search...",
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
          ListView(
            shrinkWrap: true,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 1; i < 4; i++)
                                  getCard(i.toString(), i),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Wrap(
            children: [
              for(var i=0;i<3;i++)
                getSchools()

              ],
          )
        ],
      ),
    );
  }
}
