import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/AdminHomePage.dart';
import 'package:onyourmarks/admin/Provider/BooleanProvider.dart';
import 'package:onyourmarks/admin/screens/Dashboard.dart';
import 'package:provider/provider.dart';
import 'homeCards.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyDbU6EW0djeKHhSZhAir12GbVGa3qtyVaM", appId: "1:269652040859:web:a211487bd92bdefee1fa3e", messagingSenderId: "269652040859", projectId: "onyourmarks-60696",storageBucket: "onyourmarks-60696.appspot.com")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>BooleanProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management System',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: adminHomePage()
      ),
    );
  }
}

class studentHome extends StatefulWidget {
  final String title;
  studentHome({Key? key, required this.title}) : super(key: key);

  @override
  State<studentHome> createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Management'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Row(
                children: [
                  Text('Profile'),
                ],
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10.0),
              child: ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10.0),
              child: ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView(
          children:  <Widget>[
            getCards('assets/icon pack - 1.jpg','Attendance','Here is a second line'),
            getCards('assets/icon pack - 2.jpg','Profile','Here is a second line'),
            getCards('assets/icon pack - 3.jpg','Exam','Here is a second line'),
            getCards('assets/icon pack - 4.jpg','Time-Table','Here is a second line'),
            getCards('assets/icon pack - 5.jpg','Library','Here is a second line'),
            getCards('assets/icon pack - 6.jpg','Activity','Here is a second line'),
            getCards('assets/icon pack - 7.jpg','Apply leave','Here is a second line'),
            getCards('assets/icon pack - 8.jpg','Track Bus','Here is a second line')
          ],
        ),
      ),
    );
  }
}
