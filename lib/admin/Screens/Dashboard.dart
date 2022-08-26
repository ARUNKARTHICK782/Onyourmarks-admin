import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onyourmarks/admin/CustomColors.dart';
import 'package:onyourmarks/admin/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/StudentModel.dart';
import '../Components/getExpandedWithFlex.dart';
import '../../api/apiHandler.dart';

int allStudentsCount = 0;
double boysCountPercentage = 0;
double girlsCountPercentage = 0;
double girlsCount = 0;
double boysCount = 0;

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> with TickerProviderStateMixin {
  TrackballBehavior? _trackballBehavior;
  TooltipBehavior? _tooltipBehavior;
  int studentsCount = 0;
  int teachersCount = 0;
  bool _loading = true;
  bool _anim = true;
  fetchData() async{
    var allStudents =  await getAllStudents();
    var allTeachers = await getAllTeachers();
    var genderCountList = await getStudentsGenderWiseCount();
    setState(() {
      studentsCount = allStudents.length;
      teachersCount = allTeachers.length;
      boysCount = genderCountList[0];
      girlsCount = genderCountList[1];
      boysCountPercentage = ((boysCount/studentsCount) * 100);
      girlsCountPercentage = ((girlsCount/studentsCount) * 100);
      allStudentsCount = allStudents.length;
      debugPrint("boys"+boysCountPercentage.toString()+"girsl"+girlsCountPercentage.toString());
      _loading = false;
    });
  }

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'));
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y%');
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
            backgroundColor: Scaffoldall,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:40,top: 60,bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    flex:4,
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 25,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Dashboard",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (_loading)
                ?Center(child: CircularProgressIndicator(),)
                :Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        child: SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Total No Of Students: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                      fontSize: 20),
                                ),
                                Text(
                                  studentsCount.toInt().toString(),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Total No Of Teachers: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                    fontSize: 20),
                              ),
                              Text(
                                teachersCount.toInt().toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Total No Of boys: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                boysCount.toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Total No Of girls: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                girlsCount.toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [

                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: Column(children: [
                                  // syncfusion_chart_multicolor
                                  SfCartesianChart (
                                    title:
                                        ChartTitle(text: 'Students Strength'),
                                    primaryXAxis: DateTimeAxis(
                                        intervalType: DateTimeIntervalType.years,
                                        dateFormat: DateFormat.y(),
                                        title: AxisTitle(text: 'Year')),
                                    primaryYAxis: NumericAxis(
                                        minimum: 300,
                                        maximum: 1200,
                                        interval: 100,
                                        labelFormat: '{value}',
                                        name: "Students",
                                        ),
                                    series: _getMultiColoredLineSeries(),
                                    trackballBehavior: _trackballBehavior,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SfCircularChart(
                                    title: ChartTitle(text: 'Boys Girls Chart'),
                                    series: _getGroupingPieSeries(),
                                    tooltipBehavior: _tooltipBehavior,
                                  ),
                                ]),
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
          ],
        ),
      ),
    );
  }
}

List<LineSeries<ChartData, DateTime>> _getMultiColoredLineSeries()  {
  return <LineSeries<ChartData, DateTime>>[
    LineSeries<ChartData, DateTime>(
        animationDuration: 2500,
        dataSource: <ChartData>[
          ChartData(DateTime(2015), 600),
          ChartData(DateTime(2016), 625),
          ChartData(DateTime(2017), 670),
          ChartData(DateTime(2018), 700),
          ChartData(DateTime(2019), 740),
          ChartData(DateTime(2020), 750),
          ChartData(DateTime(2021), 790),
          ChartData(DateTime(2022),allStudentsCount.toDouble())
        ],
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        /// The property used to apply the color each data.
        pointColorMapper: (ChartData sales, _) => sales.lineColor,
        width: 2)
  ];
}

List<PieSeries<ChartSampleData, String>> _getGroupingPieSeries() {
  return <PieSeries<ChartSampleData, String>>[
    PieSeries<ChartSampleData, String>(
        radius: '90%',
        dataLabelMapper: (ChartSampleData data, _) => data.x as String,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        dataSource: <ChartSampleData>[
          ChartSampleData(
              pointColor: Colors.red.shade300,
              x: 'Boys', y: boysCountPercentage, text: "Boys"),
          ChartSampleData(
              pointColor: Colors.blue.shade300,
              x: 'Girls',
              y: girlsCountPercentage,
              text: "Girls"),

        ],
        startAngle: 90,
        endAngle: 90,
        /// To enable and specify the group mode for pie chart.
        groupMode: CircularChartGroupMode.value,
        groupTo: 7,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y)
  ];
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
        this.pointColor,
        this.size,
        this.text,
        this.open,
        this.close,
        this.low,
        this.high,
        this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}


class ChartData {
  ChartData(this.x, this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color? lineColor;
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class _ChartData2 {
  _ChartData2(this.x, this.y);

  final String x;
  final double y;
}


//
// /// The home page of the application which hosts the datagrid.
// class MyHomePage extends StatefulWidget {
//   /// Creates the home page.
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<StudentModel> students = <StudentModel>[];
//   StudentDataSource studentDataSource = StudentDataSource.empty();
//
//   temp() async{
//     await getAllStudents().then((value) {
//       students = value;
//       studentDataSource = StudentDataSource(studentData: students);
//       setState(() {
//
//       });
//     });
//
//   }
//
//   @override
//   void initState() {
//     temp();
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter DataGrid'),
//       ),
//       body: SfDataGrid(
//         source: studentDataSource,
//         columnWidthMode: ColumnWidthMode.fill,
//         columns: <GridColumn>[
//           GridColumn(
//               columnName: 'id',
//               label: Container(
//                   padding: EdgeInsets.all(16.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'ID',
//                   ))),
//           GridColumn(
//               columnName: 'name',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Name'))),
//           GridColumn(
//               columnName: 'gender',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Gender',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'Mother Tongue',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Mother Tongue'))),
//         ],
//       ),
//     );
//   }
//
// }
//
//
// /// An object to set the employee collection data source to the datagrid. This
// /// is used to map the employee data to the datagrid widget.
// class StudentDataSource extends DataGridSource {
//
//   StudentDataSource.empty();
//
//   /// Creates the employee data source class with required details.
//   StudentDataSource({required List<StudentModel> studentData}) {
//     debugPrint(studentData.toString());
//     _studentData = studentData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//       DataGridCell<String>(columnName: 'id', value: e.roll_no),
//       DataGridCell<String>(columnName: 'name', value: (e.first_name.toString()+" "+e.last_name.toString())),
//       DataGridCell<String>(
//           columnName: 'gender', value: e.gender),
//       DataGridCell<String>(columnName: 'Mother Tongue', value: e.motherTongue),
//     ]))
//         .toList();
//   }
//
//   List<DataGridRow> _studentData = [];
//
//   @override
//   List<DataGridRow> get rows => _studentData;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//           return Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(8.0),
//             child: Text(e.value.toString()),
//           );
//         }).toList());
//   }
// }
