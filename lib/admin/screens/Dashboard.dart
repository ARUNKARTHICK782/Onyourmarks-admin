import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onyourmarks/apihandler/studentAPIs.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/StudentModel.dart';
import '../apiHandler.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  TrackballBehavior? _trackballBehavior;

  late List<_ChartData2> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'));

    data = [
      _ChartData2('CHN', 12),
      _ChartData2('GER', 15),
      _ChartData2('RUS', 30),
      _ChartData2('BRZ', 6.4),
      _ChartData2('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.parse("2010-02-07T00:00:00.000+00:00"), 35),
      SalesData(DateTime.parse("2011-02-07T00:00:00.000+00:00"), 28),
      SalesData(DateTime.parse("2012-02-07T00:00:00.000+00:00"), 34),
      SalesData(DateTime.parse("2013-02-07T00:00:00.000+00:00"), 32),
      SalesData(DateTime.parse("2014-02-07T00:00:00.000+00:00"), 40)
    ];

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Card(
                  color: Colors.blue[50],
                  elevation: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.accessibility),
                                      Text(
                                        "Total No Of Students: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: Colors.grey,
                                                fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "250",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.accessibility),
                                        Text(
                                          "Total No Of Teachers: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "25",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.accessibility),
                                        Text(
                                          "Total No Of boys: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "150",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.accessibility),
                                        Text(
                                          "Total No Of girls: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "100",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(children: [
                            Text("Student Strength: "),
                            // syncfusion_chart_multicolor
                            SfCartesianChart(
                              title:
                                  ChartTitle(text: 'Annual rainfall of Paris'),
                              plotAreaBorderWidth: 0,
                              primaryXAxis: DateTimeAxis(
                                  intervalType: DateTimeIntervalType.years,
                                  dateFormat: DateFormat.y(),
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                  title: AxisTitle(text: 'Year')),
                              primaryYAxis: NumericAxis(
                                  minimum: 200,
                                  maximum: 600,
                                  interval: 100,
                                  axisLine: const AxisLine(width: 0),
                                  labelFormat: '{value}mm',
                                  majorTickLines:
                                      const MajorTickLines(size: 0)),
                              series: _getMultiColoredLineSeries(),
                              trackballBehavior: _trackballBehavior,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(
                                      minimum: 0, maximum: 40, interval: 10),
                                  tooltipBehavior: _tooltip,
                                  series: <ChartSeries<_ChartData2, String>>[
                                    ColumnSeries<_ChartData2, String>(
                                        dataSource: data,
                                        xValueMapper: (_ChartData2 data, _) =>
                                            data.x,
                                        yValueMapper: (_ChartData2 data, _) =>
                                            data.y,
                                        name: 'Gold',
                                        color: Color.fromRGBO(8, 142, 255, 1))
                                  ]),
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
    );
  }
}

List<LineSeries<_ChartData, DateTime>> _getMultiColoredLineSeries() {
  return <LineSeries<_ChartData, DateTime>>[
    LineSeries<_ChartData, DateTime>(
        animationDuration: 2500,
        dataSource: <_ChartData>[
          _ChartData(
              DateTime(1925), 415, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1926), 408, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1927), 415, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1928), 350, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1929), 375, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1930), 500, const Color.fromRGBO(248, 184, 131, 1)),
          _ChartData(
              DateTime(1931), 390, const Color.fromRGBO(229, 101, 144, 1)),
          _ChartData(
              DateTime(1932), 450, const Color.fromRGBO(229, 101, 144, 1)),
          _ChartData(
              DateTime(1933), 440, const Color.fromRGBO(229, 101, 144, 1)),
          _ChartData(
              DateTime(1934), 350, const Color.fromRGBO(229, 101, 144, 1)),
          _ChartData(
              DateTime(1935), 400, const Color.fromRGBO(229, 101, 144, 1)),
          _ChartData(
              DateTime(1936), 365, const Color.fromRGBO(53, 124, 210, 1)),
          _ChartData(
              DateTime(1937), 490, const Color.fromRGBO(53, 124, 210, 1)),
          _ChartData(
              DateTime(1938), 400, const Color.fromRGBO(53, 124, 210, 1)),
          _ChartData(
              DateTime(1939), 520, const Color.fromRGBO(53, 124, 210, 1)),
          _ChartData(
              DateTime(1940), 510, const Color.fromRGBO(53, 124, 210, 1)),
          _ChartData(DateTime(1941), 395, const Color.fromRGBO(0, 189, 174, 1)),
          _ChartData(DateTime(1942), 380, const Color.fromRGBO(0, 189, 174, 1)),
          _ChartData(DateTime(1943), 404, const Color.fromRGBO(0, 189, 174, 1)),
          _ChartData(DateTime(1944), 400, const Color.fromRGBO(0, 189, 174, 1)),
          _ChartData(DateTime(1945), 500, const Color.fromRGBO(0, 189, 174, 1))
        ],
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,

        /// The property used to apply the color each data.
        pointColorMapper: (_ChartData sales, _) => sales.lineColor,
        width: 2)
  ];
}

class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);
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






/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StudentModel> students = <StudentModel>[];
  StudentDataSource studentDataSource = StudentDataSource.empty();

  temp() async{
    await getAllStudents().then((value) {
      students = value;
      studentDataSource = StudentDataSource(studentData: students);
      setState(() {

      });
    });

  }

  @override
  void initState() {
    temp();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: studentDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridColumn(
              columnName: 'gender',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Gender',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Mother Tongue',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Mother Tongue'))),
        ],
      ),
    );
  }

}


/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class StudentDataSource extends DataGridSource {

  StudentDataSource.empty();

  /// Creates the employee data source class with required details.
  StudentDataSource({required List<StudentModel> studentData}) {
    debugPrint(studentData.toString());
    _studentData = studentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'id', value: e.roll_no),
      DataGridCell<String>(columnName: 'name', value: (e.first_name.toString()+" "+e.last_name.toString())),
      DataGridCell<String>(
          columnName: 'gender', value: e.gender),
      DataGridCell<String>(columnName: 'Mother Tongue', value: e.motherTongue),
    ]))
        .toList();
  }

  List<DataGridRow> _studentData = [];

  @override
  List<DataGridRow> get rows => _studentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}
