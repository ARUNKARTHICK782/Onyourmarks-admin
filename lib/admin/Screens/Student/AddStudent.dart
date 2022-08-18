import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onyourmarks/admin/components/CommonComponents.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/admin/components/getExpandedWithFlex.dart';

class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  State<addStudent> createState() => _addStudentState();
}

enum SingingCharacter { Male, Female, Transgender }

class _addStudentState extends State<addStudent> {
  TextEditingController dateController = new TextEditingController();
  SingingCharacter? _character = SingingCharacter.Male;
  String? selectedBG;
  String? selectedGender;
  List<TextEditingController> allTextCtrls = [];

  initializeFunc(){
    setState(() {
      allTextCtrls = List.filled(11, TextEditingController());
    });
  }

  renderSingleTF(int index,String name){
    return Expanded(
      flex: 15,
      child: Container(
        height: 130,
        width: 350,
        child: Padding(
          padding:
          const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(
                    left: 25),
                child: TextField(
                  controller: allTextCtrls.elementAt(index),
                  decoration:
                  InputDecoration(
                      hintText: name
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void initState() {
    initializeFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f4f6),
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Text("New Student",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: (3 * MediaQuery.of(context).size.width)/5,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 60, bottom: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 25,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Student Details",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        renderSingleTF(0, "First Name"),
                                        getExpandedWithFlex(2),
                                        renderSingleTF(1, "Last Name")
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
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 15,
                                          child: Container(
                                            height: 130,
                                            width: 350,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25),
                                                    child: TextField(
                                                      controller:
                                                          dateController,
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                            hintText: "DOB",
                                                        suffixIcon:
                                                            IconButton(
                                                          icon: Icon(
                                                              CupertinoIcons
                                                                  .calendar),
                                                          onPressed:
                                                              () async {
                                                            DateTime?
                                                                pickedDate =
                                                                await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            1950),
                                                                    //DateTime.now() - not to allow to choose before today.
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100));

                                                            if (pickedDate !=
                                                                null) {
                                                              //pickedDate output format => 2021-03-10 00:00:00.000
                                                              String
                                                                  formattedDate =
                                                                  DateFormat(
                                                                          'yyyy-MM-dd')
                                                                      .format(
                                                                          pickedDate);
                                                              //formatted date output using intl package =>  2021-03-16
                                                              setState(() {
                                                                dateController
                                                                        .text =
                                                                    formattedDate; //set output date to TextField value.
                                                              });
                                                            } else {}
                                                          },
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(3),
                                                        isDense: true,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        getExpandedWithFlex(2),
                                        Expanded(
                                          flex: 15,
                                          child: Container(
                                            height: 250,
                                            width: 350,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 25),
                                                    child: DropdownButton<String>(
                                                      items: <String>["Male","Female"].map((e){
                                                        return DropdownMenuItem(value: e,child: Text(e));
                                                      }).toList(),
                                                      onChanged: (String? value){
                                                        setState(() {
                                                          selectedGender = value;
                                                        });
                                                      },
                                                    )
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
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
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 15,
                                              child: Container(
                                                height: 130,
                                                width: 350,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 25),
                                                        child: Text("Under Construction"),
                                                      )
                                                    ],
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
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(left: 25),
                                                            child: DropdownButton<
                                                                    String>(
                                                                value: selectedBG,
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    selectedBG =
                                                                        value;
                                                                  });
                                                                },
                                                                items: <String>[
                                                                  "A+",
                                                                  "A-",
                                                                  "B+",
                                                                  "B-",
                                                                  "O+",
                                                                  "O-",
                                                                  "AB+",
                                                                  "AB-"
                                                                ].map<
                                                                    DropdownMenuItem<
                                                                        String>>((e) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value: e,
                                                                    child: Text(e),
                                                                  );
                                                                }).toList()))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            renderSingleTF(2, "Roll No"),
                                            getExpandedWithFlex(2),
                                            Expanded(
                                              flex: 15,
                                              child: Container(
                                                height: 130,
                                                width: 350,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 25),
                                                        child:Text("Under Construction")
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 60, bottom: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 25,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Parent Details",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            renderSingleTF(3, "Father's Name"),
                                            getExpandedWithFlex(2),
                                            renderSingleTF(4,"Mother's Name")
                                          ],
                                        )
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
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            renderSingleTF(5, "Occupation"),
                                            getExpandedWithFlex(2),
                                            renderSingleTF(6,"Income")
                                          ],
                                        )
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
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            renderSingleTF(7, "Email"),
                                            getExpandedWithFlex(2),
                                            renderSingleTF(8,"PhNo")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 60, bottom: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 25,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Residential Details",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            renderSingleTF(9, "Current Address"),
                                            getExpandedWithFlex(2),
                                            renderSingleTF(10,"Permanent Address")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Cancel"),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Add Student")),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
            ),
          ),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text(""),
                      )
                ],
              ),
        ]),
      ),
    );
  }
  
}
