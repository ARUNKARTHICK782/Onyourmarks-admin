import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/AdminHomePage.dart';
import 'package:onyourmarks/admin/Provider/BooleanProvider.dart';
import 'package:onyourmarks/admin/screens/Dashboard.dart';
import 'package:provider/provider.dart';
import 'StateAdmin/StateAdminHomeScreen.dart';
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
        home: StateAdminHomeScreen()
      ),
    );
  }
}

