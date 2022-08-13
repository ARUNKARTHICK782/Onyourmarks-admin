import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CustomColors.dart';
import 'getExpandedWithFlex.dart';

getTextStyle() {
  return TextStyle(color: Colors.white);
}

getFormHeaderTextStyle(){
  return TextStyle(fontSize: 20,fontWeight: FontWeight.w600);
}


Header(String heading){
  return Padding(
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
                child: Text(heading,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
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
                // onChanged: (s){
                //   implementSearch(s);
                // },
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
  );
}