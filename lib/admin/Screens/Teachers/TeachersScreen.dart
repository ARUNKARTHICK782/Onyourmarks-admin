import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/TeacherModel.dart';
import '../../apiHandler.dart';
import './UpdateTeacherStandard.dart';
import './AddTeacher.dart';

class teachersScreen extends StatefulWidget {
  const teachersScreen({Key? key}) : super(key: key);

  @override
  State<teachersScreen> createState() => _teachersScreenState();
}

class _teachersScreenState extends State<teachersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: FutureBuilder<List<TeacherModel>>(
        future: getAllTeachers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TeacherModel>> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            children = [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ColoredBox(
                        color: Colors.transparent,
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return Material(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(5),
                                child: ExpansionTile(
                                  title: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data
                                                    ?.elementAt(index)
                                                    .name ??
                                                " ",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(snapshot.data
                                                  ?.elementAt(index)
                                                  .degree ??
                                              "")
                                        ],
                                      ),
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddTeacher(
                                                              true,
                                                              snapshot.data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .id ??
                                                                  "",
                                                              name: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .name ??
                                                                  "",
                                                              degree: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .degree ??
                                                                  "",
                                                              email: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .email ??
                                                                  "",
                                                              status: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .status ??
                                                                  "",
                                                              dob: snapshot.data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .dob ??
                                                                  "",
                                                              gender: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .gender ??
                                                                  "",
                                                              salary: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .salary ??
                                                                  "",
                                                              phNo: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .phoneNo ??
                                                                  "",
                                                              curAdd: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .currentAddress ??
                                                                  "",
                                                              perAdd: snapshot
                                                                      .data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .permanentAddress ??
                                                                  "",
                                                              mt: snapshot.data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .motherTongue ??
                                                                  "",
                                                              bg: snapshot.data
                                                                      ?.elementAt(
                                                                          index)
                                                                      .bloogGroup ??
                                                                  "",
                                                            )));
                                              },
                                              child: Text(
                                                  "Update Teacher Details")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateTeacherStandard()));
                                              },
                                              child: Text(
                                                  "Update Subject & Standard")),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: snapshot.data?.length ?? 0),
                      ),
                    ),
                  ),
                ),
              )
            ];
          } else if (snapshot.hasError) {
            children = [
              Center(
                child: Text(snapshot.error.toString()),
              )
            ];
          } else {
            children = [
              Center(
                child: CircularProgressIndicator(),
              )
            ];
          }
          return Column(children: children);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTeacher(
                        false,
                        "",
                        perAdd: '',
                        salary: '',
                        curAdd: '',
                        gender: '',
                        bg: '',
                        name: '',
                        degree: '',
                        dob: '',
                        phNo: '',
                        email: '',
                        mt: '',
                        status: '',
                      )));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
