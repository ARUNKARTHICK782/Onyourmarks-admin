import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class rssScreen extends StatefulWidget {
  const rssScreen({Key? key}) : super(key: key);

  @override
  State<rssScreen> createState() => _rssScreenState();
}

class _rssScreenState extends State<rssScreen> {
  rssFunc() async{
    RssFeed rssFeed ;
    var res=await http.get(Uri.parse("https://www.wired.com/feed/rss"));
    var items =await RssFeed.parse(res.body).items;
    for(var i in items!){
      print(i.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("RSS page"),),
    );
  }

  @override
  void initState() {
      rssFunc();
  }
}
