import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/DistrictAdmin/Screens/AllStudents.dart';
import 'package:onyourmarks/DistrictAdmin/Screens/DistrictStudentScreen.dart';
import 'package:onyourmarks/admin/Screens/Student/StudentDashboard.dart';
import 'package:onyourmarks/models/SchoolModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../admin/Components/getExpandedWithFlex.dart';
import '../../admin/CustomColors.dart';
import 'package:http/http.dart' as http;

import '../../admin/Screens/Dashboard.dart';

class DistrictSchools extends StatefulWidget {
  const DistrictSchools({Key? key}) : super(key: key);

  @override
  State<DistrictSchools> createState() => _DistrictSchoolsState();
}

class _DistrictSchoolsState extends State<DistrictSchools> {

  List<Widget> widlist = [
    DistrictSchoolMain(),
    AllStudents(),
  ];
  int pageIndex = 0;

  getCard(String text, int index) {
    int height = 50;
    int width = 80;
    if(index == 1){
      text = "Schools";
    }
    else if(index == 2){
      text = "Students";
    }
    else{
      text = "Teachers";
    }
    return Column(
      children: [
        Container(
          height: height.toDouble(),
          width: width.toDouble(),
          child: GestureDetector(
            child: Card(
              elevation: 2,
              color: secondary,
              child: Center(child: Text(text)),
            ),
            onTap: () {
              setState(() {
                pageIndex = index-1;
                debugPrint(pageIndex.toString());
              });
            },
          ),
        ),
        placeASizedBoxHere(20)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Scaffoldall,
      body: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 1; i < 4; i++)
                              getCard(i.toString(), i),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: widlist[pageIndex]),
        ],
      )
    );
  }
}


class DistrictSchoolMain extends StatefulWidget {
  const DistrictSchoolMain({Key? key}) : super(key: key);

  @override
  State<DistrictSchoolMain> createState() => _DistrictSchoolMainState();
}

class _DistrictSchoolMainState extends State<DistrictSchoolMain> {
  List<SchoolModel> schoolList = [];
  bool _loading = true;
  List<ChartSampleData>? chartData;
  late double _columnWidth;
  late double _columnSpacing;
  TooltipBehavior? _tooltipBehavior;
  TooltipBehavior? _tooltipBehavior1;
  List<_ChartData>? chartDataLine;

  getSchools(SchoolModel school){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DistrictStudentScreen(school.id.toString())));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 250,
          width: 250,
          color: Colors.blueGrey.shade50,
          child: Column(
            children: [
              Image(image: AssetImage("assets/download.jpg"),),
              SizedBox(
                height: 30,
              ),
              Text(school.school_name.toString()),
              // Text(school.sc)
            ],
          ),
        ),
      ),
    );
  }

  getSchoolsFromDB() async{
    var res = await http.get(Uri.parse("http://localhost/api/superuser/school"));
    var schools = jsonDecode(res.body);
    List<SchoolModel> schoolsList = [];
    for(var i in schools){
      SchoolModel school = SchoolModel(i["_id"], i["school_name"], i["address"], i["state"], i["city"], i["noOfStudents"], i["noOfTeachers"]);
      schoolsList.add(school);
    }
    setState(() {
      schoolList = schoolsList;
      _loading = false;
    });
  }

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    getSchoolsFromDB();
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    _tooltipBehavior1 =TooltipBehavior(enable: true);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'DY Patil', y: 16, secondSeriesYValue: 8),
      ChartSampleData(
          x: 'PSG', y: 8, secondSeriesYValue: 10),
    ];
    chartDataLine = <_ChartData>[
      _ChartData(2015, 60, 65),
      _ChartData(2016, 74, 62),
      _ChartData(2017, 62, 74),
      _ChartData(2018, 79, 75),
      _ChartData(2019, 84, 80),
      _ChartData(2020, 80, 79),
      _ChartData(2021, 89, 85)
    ];
  }


  Container _buildDefaultColumnChart() {
    return Container(
      height: 350,
      width: 450,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: 'Pass percentage of schools'
        ),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            labelFormat: '{value}%',
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getDefaultColumnSeries(),
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'DYPatil', y:98),
          ChartSampleData(x: 'PSG', y: 91),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }

  Container _buildSpacingColumnChart() {
    return Container(
      height: 350,
      width: 450,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text:  'Male-Female Strength'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            maximum: 20,
            minimum: 0,
            interval: 4,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getDefaultColumn(),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior1,
      ),
    );
  }

  ///Get the column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumn() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(

        /// To apply the column width here.
          width:  _columnWidth,

          /// To apply the spacing betweeen to two columns here.
          spacing:_columnSpacing,
          dataSource: chartData!,
          color: const Color.fromRGBO(251, 193, 55, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Male'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          width: _columnWidth,
          spacing:  _columnSpacing,
          color: const Color.fromRGBO(177, 183, 188, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Female'),
    ];
  }

  Container _buildDefaultLineChart() {
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          title: ChartTitle(text: 'School wise pass percentage'),
          legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap),
          primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 2,
              majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}%',
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(color: Colors.transparent)),
          series: _getDefaultLineSeries(),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartDataLine!,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'DY Patil',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartDataLine!,
          width: 2,
          name: 'PSG',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Scaffoldall,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:40,top: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 25,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Schools",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                              ),

                            ],
                          ),
                          Text("Pune",style: TextStyle(fontSize: 15,),
                          )
                        ],
                      ),
                    ),
                    getExpandedWithFlex(7),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 47,
                        width: 400,
                        color: Colors.grey.shade400,
                        child: TextField(
                          cursorColor: Colors.grey.shade800,
                          decoration: InputDecoration(
                              contentPadding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              suffixIcon: Icon(CupertinoIcons.search,color: secondary,),
                              hintText: "Search...",
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey.shade800)
                              // ),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    getExpandedWithFlex(1)
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No of Schools"),
                      Text(schoolList.length.toString(),style:TextStyle(fontSize: 25))
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex:2,child: _buildSpacingColumnChart()),
                      Expanded(flex:1,child: _buildDefaultColumnChart()),
                    ],
                  ),
                  _buildDefaultLineChart(),
                ],
              ),
              (_loading)?Center(child:CircularProgressIndicator()):
              Wrap(
                children: [
                  for(var i=0;i<schoolList.length;i++)
                    getSchools(schoolList.elementAt(i))
                ],
              )
            ],
          ),
        ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final double x;
  final double y;
  final double y2;
}

