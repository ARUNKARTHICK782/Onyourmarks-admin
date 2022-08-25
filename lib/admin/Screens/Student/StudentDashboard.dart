
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/Components/centerRow.dart';
import 'package:onyourmarks/models/StudentModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/CCAModel.dart';
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
  var isFetchingPage3 = true;
  var activities;


  @override
  void initState() {
    getMarks().then((v)=>{
      getCCA()
    });
  }

  getCCA() async {
    activities = await getMyActivities(widget.student.id.toString());
    (mounted)?setState(() {
      isFetchingPage3 = false;
      // print("Got CCA");
    }):null;
  }

  getMarks() async {
    marksMap = await getMyMarksAdmin(widget.student.id.toString());
    mySubjectLength = widget.student.subjects?.length;
    var marksObjects = marksMap.values.toList();
    var marksExams = marksMap.keys.toList();
    // print(mySubjectLength.toString());
    // print(marksObjects.elementAt(0).toString());
    for(var i = marksObjects.length - 1;i>=0;i--){
      if(marksObjects.elementAt(i).length == mySubjectLength){
        // print("object");
        currentMarks[marksExams.elementAt(i)] = marksObjects.elementAt(i);
        setState(() {

        });
        break;
      }

    }
    // print(currentMarks.toString());
    setState(() {
      isFetchingPage2 = false;
      // print("Got Marks");
    });
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
      (!isFetchingPage2 && !isFetchingPage3)
        ?ListView(
        children : [
          SizedBox(
            height: 50,
          ),
          customPaddedRowWidget(Row(
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
          ), 10),
          StudentDashBoard_1(student: widget.student),
          StudentDashBoard_2(currentMarks: currentMarks, marksMap: marksMap, student: widget.student,),
          StudentDashBoard_3(activities: activities, currentMarks: currentMarks)
          // (isFetchingPage1 || isFetchingPage2 || isFetchingPage3)
          //     ?Text("")
          //     :StudentDashBoard_3(activities: activities,currentMarks: currentMarks,isFetchingCCA: isFetchingPage3,)
        ]
        )
          :null,
    );
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
        customPaddedRowWidget(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex:4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 175,
                      width: 160,
                      color: Colors.blueGrey.shade50,
                    ),

                  ],
                )
            ),
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
        ), 10),
        customPaddedRowWidget(Column(
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
                      Text(fieldsName[i], style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(valuesName[i], style: TextStyle(fontWeight: FontWeight.bold),),
                      "start", "start"
                  )
              ],
            )
          ],
        ), 10),
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
    required this.currentMarks,
    required this.marksMap,
  }) : super(key: key);
  final StudentModel student;
  // final gotCards;
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
        SizedBox(
          height: 30,
        ),
        customPaddedRowWidget(
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
                      placeASizedBoxHere(20),
                      Text(widget.currentMarks.keys.first.toString().toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5
                      ),),
                      placeASizedBoxHere(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(("NAME        : "+widget.student.first_name.toString()+" "+widget.student.last_name.toString()).toUpperCase(), style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12
                        ),),
                      ),
                      placeASizedBoxHere(10),
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
                      placeASizedBoxHere(20),
                      Text((getTotalMark(widget.currentMarks.values.first)).toString() + "/" + (100*widget.currentMarks.values.first.length).toString(),style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                )
              ],
            ),10
        ),SizedBox(
          height: 25,
        ),
        customPaddedRowWidget(
            BarChartForStudentsMark(marks: widget.currentMarks.values.first),10
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

}

class StudentDashBoard_3 extends StatefulWidget {
  const StudentDashBoard_3({
    Key? key,
    required this.activities,
    required this.currentMarks
  }) : super(key: key);
  final activities;
  final currentMarks;
  @override
  State<StudentDashBoard_3> createState() => _StudentDashBoard_3State();
}

class _StudentDashBoard_3State extends State<StudentDashBoard_3> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customPaddedRowWidget( Text("PERFORMANCE",style: TextStyle(
            fontSize: 17.5,
            fontWeight: FontWeight.bold
        ),), 10),
        MultiColoredChartForDashBoard(widget.currentMarks),
        placeASizedBoxHere(20),
        BarChartForCCA(widget.activities),
        placeASizedBoxHere(20),
      ],
    );
  }
}

Row customPaddedRowWidget(Widget mainWidget, int customFlex){
  return Row(
    children: [
      Expanded(child: Text("")),
      Expanded(
        flex: customFlex,
        child: mainWidget,
      ),
      Expanded(child: Text(""))
    ],
  );
}

class BarChartForCCA extends StatefulWidget {
  final models;
  BarChartForCCA(this.models,{Key? key}) : super(key: key);

  @override
  _BarChartForCCAState createState() => _BarChartForCCAState();
}

class _BarChartForCCAState extends State<BarChartForCCA> {
  @override
  Widget build(BuildContext context) {
    return customPaddedRowWidget(
        SfCartesianChart(
            title: ChartTitle(text: "CCA Status"),
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 1),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<ChartDataForCCA, String>>[
              ColumnSeries<ChartDataForCCA, String>(
                  dataSource: getChartDataForCCA(widget.models),
                  xValueMapper: (ChartDataForCCA data, _) => data.x,
                  yValueMapper: (ChartDataForCCA data, _) => data.y,
                  name: 'Gold',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]
        ), 10);
  }
}

List<ChartDataForCCA> getChartDataForCCA(List<CCAModel> models){
  List<ChartDataForCCA> list = [];
  var participated = 0;
  var winner = 0;

  for(int i=0;i<models.length;i++){
    if(models.elementAt(i).isVerified == "accepted") {
      if (models
          .elementAt(i)
          .status == "Participation") {
        participated += 1;
      }
      if (models
          .elementAt(i)
          .status == "Winner") {
        winner += 1;
      }
    }

  }
  list.add(ChartDataForCCA("Participated",double.parse(participated.toString())));
  list.add(ChartDataForCCA("Winner", double.parse(winner.toString())));

  return list;
}

class ChartDataForCCA {
  ChartDataForCCA(this.x, this.y);

  final String x;
  final double y;
}

class MultiColoredChartForDashBoard extends StatefulWidget {
  final currentMarks;
  const MultiColoredChartForDashBoard(this.currentMarks, {Key? key}) : super(key: key);
  @override
  State<MultiColoredChartForDashBoard> createState() => _MultiColoredChartForDashBoardState();
}

class _MultiColoredChartForDashBoardState extends State<MultiColoredChartForDashBoard> {
  @override
  Widget build(BuildContext context) {
    return customPaddedRowWidget(SfCartesianChart(
      title: ChartTitle(text: 'Academics'),
      plotAreaBorderWidth: 0,
      legend: Legend(),
      primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
              overflow: TextOverflow.ellipsis
          ),
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: 'Subjects')),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 10,
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: getMultiColoredLineSeries(widget.currentMarks.values.first, context),
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y')),
    ), 10);
  }
}

List<LineSeries<ChartDataForDashBoard, String>> getMultiColoredLineSeries(List<MarksModel> marks, BuildContext context) {
  return <LineSeries<ChartDataForDashBoard, String>>[
    LineSeries<ChartDataForDashBoard, String>(
        animationDuration: 2500,
        dataSource: getChartDataForGraph(marks, context),
        xValueMapper: (ChartDataForDashBoard sales, _) => sales.x,
        yValueMapper: (ChartDataForDashBoard sales, _) => sales.y,

        /// The property used to apply the color each data.
        pointColorMapper: (ChartDataForDashBoard sales, _) => sales.lineColor,
        width: 2)
  ];
}

List<ChartDataForDashBoard> getChartDataForGraph(List<MarksModel> marks, BuildContext context){
  List<ChartDataForDashBoard> list = [];
  List<MaterialColor> list2 = [Colors.red, Colors.blue,Colors.green,Colors.deepPurple,Colors.pink, Colors.orange];
  for(var i=0;i<marks.length;i++){
    var subjectName = (MediaQuery.of(context).size.height < MediaQuery.of(context).size.width)
        ? getSubjectName(marks.elementAt(i).sub_name ?? "") ?? ""
        : getSubjectName(marks.elementAt(i).sub_name ?? "")?.substring(0,2) ?? "";
    list.add(
        ChartDataForDashBoard(
            subjectName.toUpperCase(),
            double.parse(marks.elementAt(i).obtained_marks ?? "0"),
            list2[i]
        )
    );
  }
  return list;
}

class ChartDataForDashBoard {
  ChartDataForDashBoard(this.x, this.y, [this.lineColor]);
  final String x;
  final double y;
  final Color? lineColor;
}

SizedBox placeASizedBoxHere(double height){
  return SizedBox(height: height);
}

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

class BarChartForStudentsMark extends StatefulWidget {
  const BarChartForStudentsMark({
    Key? key,
    required this.marks
  }) : super(key: key);
  final marks;

  @override
  State<BarChartForStudentsMark> createState() => _BarChartForStudentsMarkState();
}

class _BarChartForStudentsMarkState extends State<BarChartForStudentsMark> {

  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text:''),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text:'Marks'),
          minimum: 0,
          maximum: 100,
          interval: 10,
          majorTickLines: const MajorTickLines(size: 0)),
      series: getTrackerBarSeries(widget.marks, context),
      tooltipBehavior: _tooltipBehavior,
    );
  }
}

List<BarSeries<ChartSampleData, String>> getTrackerBarSeries(List<MarksModel> marks, BuildContext context) {
  return <BarSeries<ChartSampleData, String>>[
    BarSeries<ChartSampleData, String>(
      dataSource: getColumnChartValues(marks, context),
      borderRadius: BorderRadius.circular(15),
      // spacing: 0,
      color: Colors.deepPurple,
      trackColor: Colors.deepPurple.shade200,
      isTrackVisible: true,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
    ),
  ];
}

List<ChartSampleData> getColumnChartValues(List<MarksModel> marks, BuildContext context){
  List<ChartSampleData> list = [];
  for(int i=0;i<marks.length;i++){
    var subjectName = getSubjectName(marks.elementAt(i).sub_name ?? "");
    subjectName = (MediaQuery.of(context).size.height < MediaQuery.of(context).size.width)
        ? getSubjectName(marks.elementAt(i).sub_name ?? "") ?? ""
        : getSubjectName(marks.elementAt(i).sub_name ?? "")?.substring(0,2) ?? "";
    list.add(
        ChartSampleData(
            x: subjectName.toUpperCase(),
            y: int.parse(marks.elementAt(i).obtained_marks ?? "0")
        )
    );
  }

  return list;
}

String? getSubjectName(String subName) {
  int index = getStartIndexToRemove(subName);
  var subjectName = (index != -1)
      ?subName.substring(0,index)
      :subName;
  return subjectName;
}

int getStartIndexToRemove(String subName) {
  int index = subName.indexOf(RegExp(r'[0-9]'));
  return index;
}