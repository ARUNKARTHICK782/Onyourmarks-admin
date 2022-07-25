import 'package:flutter/material.dart';
import 'package:onyourmarks/Screens/eventsScreen.dart';
import 'package:onyourmarks/Screens/profileScreen.dart';
import 'package:onyourmarks/main3.dart';

Drawer getDrawer(){
  List<String> drawerList=["Profile","Events"];
  return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                height: 100,
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  child: Container(
                    color: Colors.grey.shade100,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(drawerList.elementAt(index)),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                      switch(index){
                        case 0:{

                          break;
                        }
                        case 1:{
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>eventsScreen()));
                        }
                      }
                  },
                );
              },
                itemCount: drawerList.length,
              ),
            ),
          ],
        ),
      )
  );
}