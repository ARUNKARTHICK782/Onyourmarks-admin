import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/components/AddSubjectScreen.dart';
import 'package:onyourmarks/apihandler/subject/subjectAPIs.dart';
import 'package:onyourmarks/models/SubjectModel.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  double _crossAxisSpacing = 12, _mainAxisSpacing = 12, _aspectRatio = 1.5;
  int _crossAxisCount = 4;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var height = width / _aspectRatio;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<SubjectModel>>(
          future: getAllSubjects(),
          builder: (BuildContext context,AsyncSnapshot<List<SubjectModel>> snapshot) {

            List<Widget> children = [];
            if(snapshot.hasData){
              children = [
                Padding(
                  padding: const EdgeInsets.only(left: 80,right: 80,top:40),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(10) ,
                    child: Container(
                      child: Card(
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: GridView.builder(
                            shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: _crossAxisCount,
                                crossAxisSpacing: _crossAxisSpacing,
                                mainAxisSpacing: _mainAxisSpacing,
                                childAspectRatio: _aspectRatio,
                              ), itemBuilder: (BuildContext context,int index){
                              return Card(
                                elevation: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 100,
                                    width: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data?.elementAt(index).subName ?? '',style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 25,overflow: TextOverflow.ellipsis
                                          ),),
                                          SizedBox(height: 10,),
                                          Text("Total Marks : "+ (snapshot.data?.elementAt(index).totalMarks ?? ''))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }),
                        ),
                      ),
                    ),
                  ),
                )
              ];
            }
            else if(snapshot.hasError){
              children = [
                Text(snapshot.error.toString())
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
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return addSubjectdialog();
          });
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

}
