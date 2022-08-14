import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/apiHandler.dart';
import 'package:onyourmarks/admin/components/CommonComponents.dart';
import 'package:onyourmarks/models/EventModel.dart';
import '../../Components/getExpandedWithFlex.dart';
import '../../CustomColors.dart';
import './AddEventScreen.dart';
class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<EventModel> events = [];
  bool _loading = true;

  renderEventCard(EventModel event){
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 250,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                child: Image(image: NetworkImage(event.banner_img_url.toString()),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        event.event_name ??
                            ' ',
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25)
                    ),
                    Text(event.event_description ??
                        '')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("From : "+(event.start_date?.substring(0,10) ?? " ")),
                    Text("To : "+(event.end_date?.substring(0,10) ?? " ") )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getEvents().then((v){
      setState(() {
        events = v;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_loading)?const Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
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
                            "Events",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  getExpandedWithFlex(6),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 300,
                        color: Colors.grey.shade400,
                        child: TextField(
                          // controller: _studentSearchCtrl,
                          cursorColor: Colors.grey.shade800,
                          // onChanged: (s){
                          //   implementSearch(s);
                          // },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              suffixIcon: Icon(
                                CupertinoIcons.search,
                                color: secondary,
                              ),
                              hintText: "Search",
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey.shade800)
                              // ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  getExpandedWithFlex(3)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
              child: Wrap(
                children: [
                  for(int i=0;i<events.length;i++)
                    renderEventCard(events.elementAt(i))
                ],
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEventScreen(),));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
