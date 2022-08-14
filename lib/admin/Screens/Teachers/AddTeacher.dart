import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onyourmarks/admin/components/ShowSuccessDialog.dart';
import 'package:onyourmarks/models/TeacherModel.dart';
import 'package:multiselect/multiselect.dart';
import '../../../models/SubjectModel.dart';
import '../../apiHandler.dart';
import '../../components/appbar.dart';
import '../../components/getExpandedWithFlex.dart';

class AddTeacher extends StatefulWidget {
  final bool isEditing;
  final String id;
  final String name;
  final String degree;
  final String email;
  final String status;
  final String dob;
  final String gender;
  final String salary;
  final String phNo;
  final String curAdd;
  final String perAdd;
  final String mt;
  final String bg;
  const AddTeacher(this.isEditing, this.id,
      {Key? key,
      required this.name,
      required this.degree,
      required this.email,
      required this.status,
      required this.dob,
      required this.gender,
      required this.salary,
      required this.phNo,
      required this.curAdd,
      required this.perAdd,
      required this.mt,
      required this.bg})
      : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

enum Gender { Male, Female, Transgender }

enum Status { Assigned, Unassigend }

class _AddTeacherState extends State<AddTeacher> {
  Gender? _gender;
  Status? _status;
  String? selectedBG;
  String? selectedStandard = " ";
  String? selectedSubject = " ";
  String? selectedGender = "Male";
  String? selectedStatus = "Assigned";
  String? selectedMotherTongue;
  List<String> selectedStandardIDs = [];
  List<String> standardNames = [];
  List<String> standardIDs = [];
  List<String> subjectNames = [];
  List<String> allSubjectsName = [];
  List<String> allSubjectIDs = [];

  //Temp
  String? tempStandard;
  String? tempSubject;
  String? tempMT;
  List<String> tempList = [];

  //Text Editing Controllers
  TextEditingController nameCont = new TextEditingController();
  TextEditingController degreeCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController salaryCont = new TextEditingController();
  TextEditingController phNoCont = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController curAddCont = new TextEditingController();
  TextEditingController perAddCont = new TextEditingController();
  TextEditingController motherTongueCont = new TextEditingController();

  @override
  void initState() {
    getStandardNames();
    fetchAllSubjects();
    if (widget.isEditing) {
      nameCont.text = widget.name;
      degreeCont.text = widget.degree;
      emailCont.text = widget.email;
      salaryCont.text = widget.salary;
      phNoCont.text = widget.phNo;
      dateController.text = widget.dob;
      curAddCont.text = widget.curAdd;
      perAddCont.text = widget.perAdd;
      motherTongueCont.text = widget.mt;
      selectedMotherTongue = widget.mt;
      selectedBG = widget.bg;
      _gender = (widget.gender == "Male")
          ? Gender.Male
          : (widget.gender == "Female")
              ? Gender.Female
              : Gender.Transgender;
      _status =
          (widget.gender == "Assigned") ? Status.Assigned : Status.Unassigend;
    } else {
      _gender = Gender.Male;
      _status = Status.Assigned;
      selectedBG = "A+";
    }
  }

  fetchAllSubjects() async {
    var res = await getAllSubjects();
    for (SubjectModel i in res) {
      allSubjectsName.add(i.subName ?? '');
      allSubjectIDs.add(i.id ?? '');
    }
    setState(() {});
  }

  getStandardNames() async {
    var allStandards = await getAllStandards();
    for (var i in allStandards) {
      standardNames.add(i.std_name.toString());
      standardIDs.add(i.id.toString());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: getAppBar(context),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  height: 130,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Name"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: nameCont,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Degree"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: degreeCont,
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  height: 130,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Email"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: emailCont,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
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
                                            child: (!widget.isEditing)
                                                ? DropDownMultiSelect(
                                                    onChanged:
                                                        (List<String> x) {
                                                      setState(() {
                                                        tempList = x;
                                                      });
                                                      tempList
                                                          .forEach((element) {
                                                        if (selectedStandardIDs
                                                            .contains(standardIDs
                                                                .elementAt(
                                                                    standardNames
                                                                        .indexOf(
                                                                            element)))) {
                                                          // selectedStandardIDs.remove(standardIDs.elementAt(standardNames.indexOf(element)));
                                                        } else {
                                                          selectedStandardIDs.add(
                                                              standardIDs.elementAt(
                                                                  standardNames
                                                                      .indexOf(
                                                                          element)));
                                                        }
                                                      });
                                                      //selectedStandardIDs = tempList;
                                                    },
                                                    options: standardNames,
                                                    selectedValues: tempList,
                                                    whenEmpty:
                                                        'Select Something',
                                                  )
                                                : Text(
                                                    "Cannot update standard here"))
                                      ],
                                    ),
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                      width: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Subject"),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: (allSubjectsName.isEmpty)
                                                    ? CircularProgressIndicator()
                                                    : (!widget.isEditing)
                                                        ? DropdownButton<
                                                                String>(
                                                            value: tempSubject,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                tempSubject =
                                                                    value;
                                                                selectedSubject =
                                                                    allSubjectIDs
                                                                        .elementAt(
                                                                            allSubjectsName.indexOf(value!));
                                                              });
                                                            },
                                                            items: allSubjectsName.map<
                                                                DropdownMenuItem<
                                                                    String>>((e) {
                                                              return DropdownMenuItem(
                                                                  value: e,
                                                                  child:
                                                                      Text(e));
                                                            }).toList())
                                                        : Text("Cannot update subject here"))
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
                                      height: 250,
                                      width: 350,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Working Status"),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title:
                                                        const Text('Assigned'),
                                                    leading: Radio<Status>(
                                                      value: Status.Assigned,
                                                      groupValue: _status,
                                                      onChanged:
                                                          (Status? value) {
                                                        setState(() {
                                                          _status = value;
                                                          selectedStatus =
                                                              "Assigned";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                        'Unassigned'),
                                                    leading: Radio<Status>(
                                                      value: Status.Unassigend,
                                                      groupValue: _status,
                                                      onChanged:
                                                          (Status? value) {
                                                        setState(() {
                                                          _status = value;
                                                          selectedStatus =
                                                              "Not Assigned";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("DOB"),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: TextField(
                                                controller: dateController,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                    icon: Icon(CupertinoIcons
                                                        .calendar),
                                                    onPressed: () async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                              context: context,
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

                                                      if (pickedDate != null) {
                                                        //pickedDate output format => 2021-03-10 00:00:00.000
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(
                                                                    pickedDate);
                                                        //formatted date output using intl package =>  2021-03-16
                                                        setState(() {
                                                          dateController.text =
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
                                ),
                                getExpandedWithFlex(2),
                                Expanded(
                                  flex: 15,
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 250,
                                      width: 350,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Gender"),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: const Text('Male'),
                                                    leading: Radio<Gender>(
                                                      value: Gender.Male,
                                                      groupValue: _gender,
                                                      onChanged:
                                                          (Gender? value) {
                                                        setState(() {
                                                          _gender = value;
                                                          selectedGender =
                                                              "Male";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text('Female'),
                                                    leading: Radio<Gender>(
                                                      value: Gender.Female,
                                                      groupValue: _gender,
                                                      onChanged:
                                                          (Gender? value) {
                                                        setState(() {
                                                          _gender = value;
                                                          selectedGender =
                                                              "Female";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                        'Transgender'),
                                                    leading: Radio<Gender>(
                                                      value: Gender.Transgender,
                                                      groupValue: _gender,
                                                      onChanged:
                                                          (Gender? value) {
                                                        setState(() {
                                                          _gender = value;
                                                          selectedGender =
                                                              "Transgender";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  height: 130,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Salary"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: salaryCont,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Phone No"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: phNoCont,
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Current Address"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: curAddCont,
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
                                      minHeight: 130, minWidth: 350),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Permanent Address"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: TextField(
                                            controller: perAddCont,
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  height: 130,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Mother Tongue"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: DropdownButton<String>(
                                              value: selectedMotherTongue,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedMotherTongue = value;
                                                });
                                              },
                                              items: <String>[
                                                "Hindi",
                                                "English",
                                                "Bengali",
                                                "Marathi",
                                                "Telugu",
                                                "Tamil",
                                                "Gujarati",
                                                "Urdu",
                                                "Kannada",
                                                "Odia",
                                                "Malayalam",
                                                "Punjabi",
                                                "Assamese",
                                                "Maithili",
                                                "Manipuri",
                                                "Sanskrit"
                                              ].map<DropdownMenuItem<String>>(
                                                  (e) {
                                                return DropdownMenuItem(
                                                    value: e, child: Text(e));
                                              }).toList(),
                                            ))
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Blood Group"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: DropdownButton<String>(
                                                value: selectedBG,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedBG = value;
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
                                                ].map<DropdownMenuItem<String>>(
                                                    (e) {
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
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Cancel"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          (widget.isEditing)
                              ? ElevatedButton(
                                  onPressed: () async {
                                    TeacherModel teacher =
                                        TeacherModel.editTeacher(
                                            widget.id,
                                            nameCont.text,
                                            degreeCont.text,
                                            dateController.text,
                                            selectedGender,
                                            emailCont.text,
                                            phNoCont.text,
                                            curAddCont.text,
                                            perAddCont.text,
                                            selectedMotherTongue,
                                            selectedBG,
                                            salaryCont.text,
                                            selectedStatus);
                                    await updateTeacherDetails(teacher)
                                        .then((v) => {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return ShowSuccessDialog(
                                                        "Teacher updated");
                                                  })
                                            });
                                  },
                                  child: Text("Save Changes"))
                              : ElevatedButton(
                                  onPressed: () async {
                                    TeacherModel teacher =
                                        TeacherModel.addTeacher(
                                            nameCont.text,
                                            degreeCont.text,
                                            dateController.text,
                                            selectedGender,
                                            emailCont.text,
                                            phNoCont.text,
                                            curAddCont.text,
                                            perAddCont.text,
                                            selectedMotherTongue,
                                            selectedBG,
                                            salaryCont.text,
                                            selectedStatus,
                                            selectedSubject,
                                            selectedStandardIDs);
                                    await postTeacher(teacher).then((v) => {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ShowSuccessDialog(
                                                    "Teacher added");
                                              })
                                        });
                                  },
                                  child: Text("Add Teacher")),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
