import 'package:flutter/material.dart';

import '../../apiHandler.dart';

class UpdateTeacherStandard extends StatefulWidget {
  const UpdateTeacherStandard({Key? key}) : super(key: key);

  @override
  State<UpdateTeacherStandard> createState() => _UpdateTeacherStandardState();
}

class _UpdateTeacherStandardState extends State<UpdateTeacherStandard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Card(
              color: Colors.grey.shade100,
              elevation: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.red,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                          Card(
                            child: Text("") ,
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
    );
  }

  @override
  void initState() {
      getTeacher("62dd3942881d7ff0608758bc");
  }
}
