import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks/api/apiLink.dart';
import 'package:onyourmarks/apihandler/studentAPIs/studentAPIs.dart';
import 'package:onyourmarks/models/StudentModel.dart';

class studentsScreen extends StatefulWidget {
  const studentsScreen({Key? key}) : super(key: key);

  @override
  State<studentsScreen> createState() => _studentsScreenState();
}

class _studentsScreenState extends State<studentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<StudentModel>>(
        future: getAllStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<StudentModel>> snapshot){
          List<Widget> children=[];
          if(snapshot.hasData){
            children = <Widget>[
              Icon(CupertinoIcons.search),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      child: Card(
                        child: Container(
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(snapshot.data?.elementAt(index).name ?? ' '),
                                Text(snapshot.data?.elementAt(index).std_id ?? '')
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: (){

                      },
                    );
                  }),
                ),
              )
            ];
          }
          else if(snapshot.hasError){
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          }
          else{
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.add)),
      ),
    );
  }
  initialFunc() async{
      var res = await http.get(
          Uri.parse(apiLink.apilink+"api/admin/allstudents"),
      );
      debugPrint(res.body);
  }

  @override
  void initState() {
    initialFunc();
  }
}
