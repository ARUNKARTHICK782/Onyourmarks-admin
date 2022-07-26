import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/components/getExpandedWithFlex.dart';

class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Card(
                color: Colors.grey.shade100,
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 15,
                                    child: Card(
                                      elevation: 2,
                                      child: Container(
                                        height: 130,
                                        width: 350,
                                        child:Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("First Name"),
                                              SizedBox(height: 25,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.all(3),
                                                    isDense: true,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  getExpandedWithFlex(2),
                                  Expanded(
                                    flex: 15,
                                    child: Card(
                                      elevation: 3,
                                      child: Container(
                                        height: 130,
                                        width: 350,
                                        child:Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Last Name"),
                                              SizedBox(height: 25,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.all(3),
                                                    isDense: true,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(2),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Expanded(flex:3,child: Text("First Name")),
                              //           Expanded(
                              //             flex: 10,
                              //             child: Container(
                              //                 height: 60,
                              //                 width: 150,
                              //                 child: TextField(
                              //                   decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                       borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                   ),
                              //                 )
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     getExpandedWithFlex(2),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Expanded(flex:3,child: Text("Last Name")),
                              //           Expanded(
                              //             flex:10,
                              //             child: Container(
                              //                 height: 60,
                              //                 width: 150,
                              //                 child: TextField(
                              //                   decoration: InputDecoration(
                              //                       border: OutlineInputBorder(
                              //                           borderRadius: BorderRadius.circular(5)
                              //                       )
                              //                   ),
                              //                 )
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     getExpandedWithFlex(2),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("DOB"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 15,
                              //       child: Row(
                              //         children: [
                              //           Text("Gender"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("Father's Name"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 15,
                              //       child: Row(
                              //         children: [
                              //           Text("Mother's Name"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("Email"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 15,
                              //       child: Row(
                              //         children: [
                              //           Text("Income"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("Phone No"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 15,
                              //       child: Row(
                              //         children: [
                              //           Text("Current Address"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("Permanent Address"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Expanded(
                              //       flex: 15,
                              //       child: Row(
                              //         children: [
                              //           Text("Mother Tongue"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     getExpandedWithFlex(9),
                              //     Expanded(
                              //       flex: 10,
                              //       child: Row(
                              //         children: [
                              //           Text("Blood Group"),
                              //           SizedBox(width: 30,),
                              //           Container(
                              //               height: 60,
                              //               width: 150,
                              //               child: TextField(
                              //                 decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                         borderRadius: BorderRadius.circular(5)
                              //                     )
                              //                 ),
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Roll No"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Standard"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("DOB"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Gender"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Father's Name"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Mother's Name"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Occupation"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Income"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Email"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Phone No"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 130,
                                            minWidth: 350,
                                          ),
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Current Address"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    maxLines: 5,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: ConstrainedBox(

                                          constraints: BoxConstraints(
                                            minHeight: 130,
                                            minWidth: 350
                                          ),
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Permanent Address"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    maxLines: 5,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Mother Tongue"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    getExpandedWithFlex(2),
                                    Expanded(
                                      flex: 15,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 130,
                                          width: 350,
                                          child:Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Blood Group"),
                                                SizedBox(height: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(3),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("First Name")),
                                //           Expanded(
                                //             flex: 10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                       borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Expanded(flex:3,child: Text("Last Name")),
                                //           Expanded(
                                //             flex:10,
                                //             child: Container(
                                //                 height: 60,
                                //                 width: 150,
                                //                 child: TextField(
                                //                   decoration: InputDecoration(
                                //                       border: OutlineInputBorder(
                                //                           borderRadius: BorderRadius.circular(5)
                                //                       )
                                //                   ),
                                //                 )
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     getExpandedWithFlex(2),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("DOB"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Gender"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Father's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother's Name"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Email"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Income"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Phone No"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Current Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Permanent Address"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 15,
                                //       child: Row(
                                //         children: [
                                //           Text("Mother Tongue"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     getExpandedWithFlex(9),
                                //     Expanded(
                                //       flex: 10,
                                //       child: Row(
                                //         children: [
                                //           Text("Blood Group"),
                                //           SizedBox(width: 30,),
                                //           Container(
                                //               height: 60,
                                //               width: 150,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                     border: OutlineInputBorder(
                                //                         borderRadius: BorderRadius.circular(5)
                                //                     )
                                //                 ),
                                //               )
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
