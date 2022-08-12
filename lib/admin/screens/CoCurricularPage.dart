import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/CommonComponents.dart';
import 'package:onyourmarks/admin/customColors.dart';
import 'package:onyourmarks/apihandler/CCA_APIs.dart';
import 'package:onyourmarks/models/CoCurricularActivityModel.dart';

class CoCurricularPage extends StatefulWidget {
  const CoCurricularPage({Key? key}) : super(key: key);

  @override
  State<CoCurricularPage> createState() => _CoCurricularPageState();
}

class _CoCurricularPageState extends State<CoCurricularPage> {
  List<CoCurricularActivityModel> allCCA = [];
  List<CoCurricularActivityModel> pendingCCA = [];
  List<CoCurricularActivityModel> rejectedCCA = [];
  List<CoCurricularActivityModel> acceptedCCA = [];
  String std = "1";
  int _selectedCardIndex = 0;
  Map<String, List<CoCurricularActivityModel>> cca = {};

  getCard(String text, int index) {
    int height = 50;
    int width = 50;
    bool expanded = false;
    int ind = index - 1;
    return StatefulBuilder(
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
                color: (_selectedCardIndex == ind)
                    ? Color.fromARGB(255, 106, 101, 136)
                    : secondary,
                child: Center(child: Text(text)),
              ),
              onTap: () {
                setState(() {
                  _selectedCardIndex = int.parse(text) - 1;
                  expanded = !expanded;
                  width = (expanded) ? 100 : 50;
                  Future.delayed(Duration(milliseconds: 100)).then((value) {
                    if (expanded)
                      std = text;
                    else
                      std = "1";
                    getStdWiseCCA(std);
                  });
                });
              },
            ),
          ),
        );
      },
    );
  }

  getStdWiseCCA(String std) {
    if (!cca.containsKey(std))
      allCCA = [];
    else {
      cca.forEach((key, value) {
        if (key.toString() == std) {
          allCCA = value;
        }
      });
    }
    setState(() {});
  }

  getAllCCA() async {
    allCCA.clear();
    cca.clear();
    for (var value in await getCCA()) {
      if (value.isVerified == "pending") {
        allCCA.add(value);
      } else if (value.isVerified == "rejected") {
        allCCA.add(value);
      } else {
        allCCA.add(value);
      }
      // List<CoCurricularActivityModel> _value = (cca.containsKey(value.std_name))
      // //                 ?cca[value.std_name] ?? []
      // //                 :[];
      // //
      // // _value.add(value);
      // // cca[value.std_name] = _value;

      if (cca.keys
          .any((element) => value.std_name.toString().contains(element))) {
        var temp = value.std_name.toString();
        if (value.std_name.contains("11"))
          temp = "11";
        else if (value.std_name.toString().contains("12")) temp = "12";
        var _value = cca[temp];
        _value?.add(value);
        cca[temp] = _value ?? [];
      } else {
        if (value.std_name.toString().contains("11")) {
          cca["11"] = [value];
          continue;
        } else if (value.std_name.toString().contains("12")) {
          cca["12"] = [value];
          continue;
        }
        cca[value.std_name.toString()] = [value];
      }
    }
    await getStdWiseCCA("1");
  }

  @override
  void initState() {
    getAllCCA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Color.fromARGB(255, 162, 159, 176),
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 1; i < 13; i++)
                              getCard(i.toString(), i),
                          ],
                        ),
                      ),
                      Expanded(
                        child: (allCCA.isEmpty)
                            ? Center(
                                child: Text("No CCA's to display"),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: allCCA.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 250),
                                      child: SizedBox(
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Card(
                                            color: Color(0xffE0E2DB),
                                            elevation: 2,
                                            child: Row(
                                              children: [
                                                // Expanded(
                                                //   flex: 1,
                                                //   child: ClipRRect(
                                                //     borderRadius: BorderRadius.circular(20),
                                                //     child: Container(
                                                //       height: 60,
                                                //       width: 60,
                                                //       color: Colors.grey,
                                                //     ),
                                                //   ),
                                                // ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Material(
                                                    color: Color.fromARGB(
                                                        255, 79, 74, 110),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(60),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child: Container(
                                                        color: Color.fromARGB(
                                                            255, 79, 74, 110),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Student Name : " +
                                                                  (allCCA
                                                                          .elementAt(
                                                                              index)
                                                                          .student
                                                                          ?.name ??
                                                                      " "),
                                                              style:
                                                                  getTextStyle(),
                                                            ),
                                                            Text(
                                                              "Class : " +
                                                                  allCCA
                                                                      .elementAt(
                                                                          index)
                                                                      .std_name
                                                                      .toString(),
                                                              style:
                                                                  getTextStyle(),
                                                            ),
                                                            Text(
                                                              "Roll No : " +
                                                                  (allCCA
                                                                          .elementAt(
                                                                              index)
                                                                          .student
                                                                          ?.roll_no ??
                                                                      " "),
                                                              style:
                                                                  getTextStyle(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Activity Name : " +
                                                            allCCA
                                                                .elementAt(
                                                                    index)
                                                                .activity_name
                                                                .toString()),
                                                        Text("Activity Type : " +
                                                            allCCA
                                                                .elementAt(
                                                                    index)
                                                                .activity_type
                                                                .toString())
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: (allCCA
                                                                  .elementAt(
                                                                      index)
                                                                  .isVerified ==
                                                              "accepted")
                                                          ? Icon(
                                                              CupertinoIcons
                                                                  .checkmark_alt_circle_fill,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          : (allCCA
                                                                      .elementAt(
                                                                          index)
                                                                      .isVerified ==
                                                                  "pending")
                                                              ? Icon(
                                                                  CupertinoIcons
                                                                      .exclamationmark,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : Icon(
                                                                  CupertinoIcons
                                                                      .xmark_circle_fill,
                                                                  color: Colors
                                                                      .redAccent,
                                                                ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CoCurricularDecisionPage(
                                                cca: allCCA.elementAt(index));
                                          }).then((value) {
                                        initState();
                                      });
                                    },
                                  );
                                }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CoCurricularDecisionPage extends StatefulWidget {
  final CoCurricularActivityModel cca;
  const CoCurricularDecisionPage({Key? key, required this.cca})
      : super(key: key);

  @override
  State<CoCurricularDecisionPage> createState() =>
      _CoCurricularDecisionPageState();
}

class _CoCurricularDecisionPageState extends State<CoCurricularDecisionPage> {
  _getTextStyle() {
    return TextStyle(fontWeight: FontWeight.w600);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(flex: 4, child: Container()),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: Text("Activity ID : " + (widget.cca.id ?? "")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Name :",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Roll No : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Class : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Section : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Event Type : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Activity Name : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Starting Date : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Ending Date : ",
                                    style: _getTextStyle(),
                                  ),
                                  Text(
                                    "Status : ",
                                    style: _getTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text((widget.cca.student?.first_name ??
                                            " ") +
                                        " " +
                                        (widget.cca.student?.last_name ?? " ")),
                                    Text(widget.cca.student?.roll_no ?? " "),
                                    Text(widget.cca.std_name ?? ""),
                                    Text(widget.cca.std_name ?? ""),
                                    Text(widget.cca.activity_type ?? ""),
                                    Text(widget.cca.activity_name ?? ""),
                                    Text(widget.cca.startDate
                                            ?.substring(0, 10) ??
                                        ""),
                                    Text(widget.cca.endDate?.substring(0, 10) ??
                                        ""),
                                    Text(widget.cca.status ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () async {
                              await updateCCA(widget.cca.id ?? " ", "rejected")
                                  .then((value) {
                                Navigator.pop(context);
                              });
                            },
                            child: Text("Reject"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: ElevatedButton(
                          onPressed: () async {
                            await updateCCA(widget.cca.id ?? " ", "accepted")
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Approve"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
