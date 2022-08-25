
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/models/StudentModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/MarksModel.dart';
import '../../../api/apiHandler.dart';
import '../Dashboard.dart';

class StudentDashboard extends StatefulWidget {
  final StudentModel student;
  const StudentDashboard(this.student,{Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  //Page 1
  // Map<String, dynamic>? me;
  // var isFetchingPage1 = true;
  // List<String>? keysOfMe = [];
  //
  //
  // var fieldsName = ["NAME","ROLL NO","STANDARD","GENDER","FATHER NAME","ADDRESS","PHONE NO"];
  // var valuesName = ["","roll_no","std_id","gender","parent1name","currentAddress","phoneNo"];

  // getMyInfo() async {
  //   valuesName[0] = widget.student.first_name.toString()+""+widget.student.last_name.toString();
  //   for(var i in keysOfMe!){
  //     if(valuesName.contains(i)){
  //       int _index = valuesName.indexOf(i);
  //       if(i == "std_id"){
  //         valuesName[_index] = me?[i]["std_name"].toString() ?? "";
  //         continue;
  //       }
  //       valuesName[_index] = me?[i].toString() ?? "";
  //     }
  //   }
  //
  //   (mounted)?setState(() {
  //     isFetchingPage1 = false;
  //     // print("Got Info");
  //   }):null;
  // }

  //Page 2
  Map<String, List<MarksModel>> marksMap = {};
  Map<String, List<MarksModel>> currentMarks = {};
  var gotCards = false;
  bool isFetchingPage2 = true;
  var mySubjectLength;

  getMarks() async {
    marksMap = await getMyMarks();
    mySubjectLength = widget.student.subjects?.length;
    var marksObjects = marksMap.values.toList();
    var marksExams = marksMap.keys.toList();

    for(var i = marksObjects.length - 1;i>=0;i--){
      if(marksObjects.elementAt(i).length == mySubjectLength){
        currentMarks[marksExams.elementAt(i)] = marksObjects.elementAt(i);
        (mounted)?setState(() {}):null;
        break;
      }
    }
    (mounted)?setState(() {
      isFetchingPage2 = false;
      // print("Got Marks");
    }):null;
  }

  //Page 3
  // var isFetchingPage3 = true;
  // var activities;

  // getCCA() async {
  //   activities = await getMyActivities();
  //   (mounted)?setState(() {
  //     isFetchingPage3 = false;
  //     // print("Got CCA");
  //   }):null;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
          children : [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex:4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 30,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "DASHBOARD",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("INDIVIDUAL STUDENT ANALYSIS")
                    ],
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    minRadius: 30,
                    child: Text(widget.student.first_name.toString()+" "+widget.student.last_name.toString().toUpperCase(), style: TextStyle(
                        fontSize: 30
                    ),),
                  ),
                )
              ],
            ),
            StudentDashBoard_1(student: widget.student),
            StudentDashBoard_2(currentMarks: currentMarks, gotCards: gotCards, marksMap: marksMap, student: widget.student,),
            // (isFetchingPage1 || isFetchingPage2 || isFetchingPage3)
            //     ?Text("")
            //     :StudentDashBoard_3(activities: activities,currentMarks: currentMarks,isFetchingCCA: isFetchingPage3,)
          ]
      ),
    );
  }

  @override
  void initState() {
    // getMyInfo();
  }
}

class StudentDashBoard_1 extends StatefulWidget {
  const StudentDashBoard_1({
    Key? key,
   required this.student
  }) : super(key: key);
  final StudentModel student;
  @override
  State<StudentDashBoard_1> createState() => _StudentDashBoard_1State();
}

class _StudentDashBoard_1State extends State<StudentDashBoard_1> {

  List<DoughnutSeries<ChartSampleData, String>> getSemiDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: '', y: 59, text: null),
            ChartSampleData(x: '', y: 41, text: null),
          ],
          innerRadius: '50%',
          radius: '100%',
          startAngle: 270,
          endAngle: 90,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
  TableRow getTableRow(Widget fieldWidget, Widget valueWidget, String align1, String align2){
    return TableRow(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 128,
            minHeight: 54,
          ),
          child: Row(
            mainAxisAlignment: (align1 == "center")
                ?MainAxisAlignment.center
                :MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: fieldWidget,
              ),
            ],
          ),
        ),
        ConstrainedBox(
            child: Row(
              mainAxisAlignment: (align2 == "center")
                  ?MainAxisAlignment.center
                  :MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: valueWidget,
                ),
              ],
            ),
            constraints: BoxConstraints(
                minWidth: 128,
                minHeight: 54
            )
        )
      ],
    );
  }

  List<String> fieldsName=[];
  List<String> valuesName = [];
  @override
  void initState() {
     fieldsName = ["NAME","ROLL NO","STANDARD","GENDER","FATHER NAME","ADDRESS","PHONE NO"];
     valuesName = [
       widget.student.first_name.toString()+" "+widget.student.last_name.toString(),
       widget.student.roll_no.toString(),
    widget.student.std_name.toString(),
    widget.student.gender.toString(),
    widget.student.fatherName.toString(),
    widget.student.permanentAddress.toString(),
    widget.student.phno.toString()
     ];
     setState(() {

     });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //     flex:4,
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Container(
            //               height: 175,
            //               width: 50,
            //               color: Colors.transparent,
            //               child: Image.asset('Images/DashBoard-Image.png')
            //           ),
            //         ),
            //
            //       ],
            //     )
            // ),
            Expanded(
              flex:5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    // color: Colors.red,
                    child: SfCircularChart(
                      title: ChartTitle(text: 'Attendance Percentage',textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                      series: getSemiDoughnutSeries(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Table(
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(5),
                  width: 1.25
              ),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
                5: FlexColumnWidth(),
                6: FlexColumnWidth(),
                7: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                for(var i=0;i<7;i++)
                  getTableRow(
                      Text(fieldsName[i] ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(valuesName[i] ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
                      "start", "start"
                  )
              ],
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}



class StudentDashBoard_2 extends StatefulWidget {
  const StudentDashBoard_2({
    Key? key,
    required this.student,
    required this.gotCards,
    required this.currentMarks,
    required this.marksMap,
  }) : super(key: key);
  final StudentModel student;
  final gotCards;
  final currentMarks;
  final marksMap;
  @override
  State<StudentDashBoard_2> createState() => _StudentDashBoard_2State();
}

class _StudentDashBoard_2State extends State<StudentDashBoard_2> {

  getTotalMark(List<MarksModel> list){
    var total = 0;
    for(var i in list){
      total = total + int.parse(i.obtained_marks ?? "0");
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Row(
              children: [
                Expanded(
                  flex:4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CURRENT EXAM STATUS", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                      Text(widget.currentMarks.keys.first.toString().toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(("NAME        : "+widget.student.first_name.toString()+" "+widget.student.last_name.toString()).toUpperCase(), style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("ROLL NO : "+widget.student.roll_no.toString(), style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12
                        ),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircularChart(widget.currentMarks.values.first),
                      Text((getTotalMark(widget.currentMarks.values.first)).toString() + "/" + (100*widget.currentMarks.values.first.length).toString(),style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                )
              ],
            ),
            // BarChartForStudentsMark(marks: widget.currentMarks.values.first),10
      ],
    );
  }

}

//
// class StudentDashBoard_3 extends StatefulWidget {
//   const StudentDashBoard_3({
//     Key? key,
//     required this.activities,
//     required this.isFetchingCCA,
//     required this.currentMarks
//   }) : super(key: key);
//   final activities;
//   final isFetchingCCA;
//   final currentMarks;
//   @override
//   State<StudentDashBoard_3> createState() => _StudentDashBoard_3State();
// }
//
// class _StudentDashBoard_3State extends State<StudentDashBoard_3> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         customPaddedRowWidget( Text("PERFORMANCE",style: TextStyle(
//             fontSize: 17.5,
//             fontWeight: FontWeight.bold
//         ),), 10),
//         MultiColoredChartForDashBoard(widget.currentMarks),
//         placeASizedBoxHere(20),
//         BarChartForCCA(widget.activities),
//         placeASizedBoxHere(20),
//       ],
//     );
//   }
// }


class CircularChart extends StatefulWidget {
  final marks;
  const CircularChart(this.marks,{Key? key}) : super(key: key);

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  List<ChartSampleData> getTheChartSegments(List<MarksModel> marks){
    List<ChartSampleData> list = [];

    for(int i=0;i<marks.length;i++){
      var valueY = int.parse(marks[i].obtained_marks!)/6;
      list.add(ChartSampleData(x: marks[i].sub_name, y: valueY,text: ' ',));
    }

    return list;
  }
  List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries(List<MarksModel> marks) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          radius: '80%',
          explode: true,
          // strokeWidth: 1000,
          explodeOffset: '10%',
          dataSource: getTheChartSegments(marks),
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: SfCircularChart(
        margin: EdgeInsets.all(0),
        title: ChartTitle(text:''),
        series: getDefaultDoughnutSeries(widget.marks),
        tooltipBehavior:TooltipBehavior(enable: true, format: 'point.x : point.y%'),
      ),
    );
  }
}