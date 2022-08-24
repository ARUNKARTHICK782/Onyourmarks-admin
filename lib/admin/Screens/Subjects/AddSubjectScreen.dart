import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import '../../apiHandler.dart';
import '../../components/getExpandedWithFlex.dart';

class addSubjectdialog extends StatefulWidget {
  final bool isEditing;
  final String sub_name;
  final String tot_marks;
  final String sub_id;
  const addSubjectdialog(
      this.isEditing, this.sub_name, this.tot_marks, this.sub_id,
      {Key? key})
      : super(key: key);

  @override
  State<addSubjectdialog> createState() => _addSubjectdialogState();
}

class _addSubjectdialogState extends State<addSubjectdialog> {
  String? v;
  String? s;

  TextEditingController subjectNameController = new TextEditingController();
  TextEditingController totalMarksController = new TextEditingController();
  String selectedStandard = "";
  String selectedSection = "";
  bool showSection = false;

  @override
  void initState() {
    subjectNameController.text = widget.sub_name;
    totalMarksController.text = widget.tot_marks;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    height: 130,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Subject Name"),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: subjectNameController,
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
                Card(
                  elevation: 3,
                  child: Container(
                    height: 130,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Marks"),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: totalMarksController,
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
                (widget.isEditing)
                    ? Text("")
                    : Card(
                        elevation: 3,
                        child: Container(
                          height: 130,
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Standard"),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: DropdownButton<String>(
                                            value: v,
                                            onChanged: (value) {
                                              setState(() {
                                                v = value;
                                                selectedStandard = value!;
                                                if ([
                                                  "11",
                                                  "12"
                                                ].contains(selectedStandard)) {
                                                  setState(() {
                                                    showSection = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    showSection = false;
                                                  });
                                                }
                                              });
                                            },
                                            items: <String>[
                                              '1',
                                              '2',
                                              '3',
                                              '4',
                                              '5',
                                              '6',
                                              '7',
                                              '8',
                                              '9',
                                              '10',
                                              '11',
                                              '12'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ))
                                    ],
                                  ),
                                ),
                                getExpandedWithFlex(2),
                                Expanded(
                                  flex: 3,
                                  child: (showSection)
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Section"),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: DropdownButton<String>(
                                                  value: s,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      s = value;
                                                      selectedSection = value!;
                                                    });
                                                  },
                                                  items: <String>['A', 'B', 'C']
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ))
                                          ],
                                        )
                                      : Text(""),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: ()async{
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.red,
                              width: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      (!widget.isEditing)
                          ? InkWell(
                            onTap: ()async{
                              String temp = (showSection)
                                  ? selectedStandard + "-" + selectedSection
                                  : selectedStandard;
                              await addSubject(subjectNameController.text,
                                  totalMarksController.text, temp)
                                  .then((value) async {
                                Navigator.pop(context);
                                initState();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  color: primary,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(child: Text("Add Subject",style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                              ),
                            ),
                          )
                          : InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  color: primary,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(child: Text("Save",style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async{
                              await updateSubject(
                                  subjectNameController.text,
                                  totalMarksController.text,
                                  widget.sub_id)
                                  .then((value) async {
                                Navigator.pop(context);
                                initState();
                              });
                            },
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
