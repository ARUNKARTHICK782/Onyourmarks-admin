import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks/DistrictAdmin/Screens/DistrictsScreen.dart';

import '../admin/Components/getExpandedWithFlex.dart';
import '../admin/CustomColors.dart';

class StateAdminHomeScreen extends StatefulWidget {
  const StateAdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<StateAdminHomeScreen> createState() => _StateAdminHomeScreenState();
}

class _StateAdminHomeScreenState extends State<StateAdminHomeScreen> {

  List<Widget> widlist = [
    DistrictScreen(),
    

  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widlist.elementAt(pageIndex)
    );
  }
}
