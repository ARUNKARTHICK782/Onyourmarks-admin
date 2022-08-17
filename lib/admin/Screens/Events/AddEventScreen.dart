import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:flutter/foundation.dart';
import 'package:onyourmarks/admin/apiHandler.dart';
import 'package:onyourmarks/admin/components/appbar.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html;

import '../../Components/getExpandedWithFlex.dart';
import '../../CustomColors.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  bool _imgChosen = false;
  String option1Text = "Initialized text option1";
  TextEditingController eventNameCtlr = TextEditingController();
  TextEditingController eventDescriptionCtrl = TextEditingController();
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  Uint8List? imageFile;
  String imgLink = "";
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 60, bottom: 30),
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
                              "Add Event",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 350,
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: eventNameCtlr,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          hintText: "Event name"
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: eventDescriptionCtrl,
                                      maxLines: 10,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          hintText: "Event Description"
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: startDateCtrl,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(icon: const Icon(CupertinoIcons.calendar),onPressed: (){
                                      showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(
                                                DateTime.now().year + 2)
                                      ).then((value) {
                                          setState(() {
                                            startDateCtrl.text = value.toString().substring(0,10);
                                          });
                                      });
                                      },),
                                      hintText: "Start Date"
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: endDateCtrl,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(icon: const Icon(CupertinoIcons.calendar),onPressed: (){
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(
                                                DateTime.now().year + 2)
                                        ).then((value) {
                                          setState(() {
                                            endDateCtrl.text = value.toString().substring(0,10);
                                          });
                                        });
                                      },),
                                      hintText: "End Date"
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    width: MediaQuery.of(context).size.width/2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30,vertical: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.grey.shade300,
                          child: Center(
                          child: (_imgChosen)?Padding(padding: const EdgeInsets.all(20),child: Image.memory(imageFile!)):TextButton(
                            onPressed: ()async{
                              result = await FilePicker.platform.pickFiles();
                              imageFile = result?.files.single.bytes;
                              setState(() {
                                _imgChosen = true;
                              });
                            },
                            child: Text("Choose Image"),
                          ),
                        ),
                      ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  getExpandedWithFlex(1),
                  InkWell(
                    onTap: ()async{
                      await postNewEvent(eventNameCtlr.text, eventDescriptionCtrl.text, startDateCtrl.text, endDateCtrl.text, imageFile!);
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
                            child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  getExpandedWithFlex(1)
                ],
              ),
            ],
          ),
        ),
    );
  }
}
