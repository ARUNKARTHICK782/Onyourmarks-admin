import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/screens/AddStandardScreen.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:onyourmarks/apihandler/standardAPIs.dart';
import 'package:onyourmarks/models/StandardModel.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: FutureBuilder<List<StandardModel>>(
        future: getAllStandards(),
        builder: (BuildContext context,
            AsyncSnapshot<List<StandardModel>> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            children = [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTile(
                          title: Material(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue[50],
                            child: Container(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data
                                              ?.elementAt(index)
                                              .std_name ??
                                          " ",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index1) {
                                      return Card(
                                        color: Colors.blue[50],
                                        elevation: 2,
                                        child: SizedBox(
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data
                                                          ?.elementAt(index)
                                                          .subjects
                                                          ?.elementAt(index1)
                                                          .subName ??
                                                      "",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  snapshot.data
                                                          ?.elementAt(index)
                                                          .subjects
                                                          ?.elementAt(index1)
                                                          .totalMarks ??
                                                      "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data
                                        ?.elementAt(index)
                                        .subjects
                                        ?.length,
                                    shrinkWrap: true,
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }),
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
          return Column(
            children: children,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddStandard()));
        },
      ),
    );
  }

  @override
  void initState() {
    getAllStandards();
  }
}
