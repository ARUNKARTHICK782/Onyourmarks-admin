import 'package:flutter/cupertino.dart';

class BooleanProvider extends ChangeNotifier{
  bool? _nextpage;
  bool? _addExam;


  bool? get addExam => _addExam;

  set addExam(bool? value) {
    _addExam = value;
    notifyListeners();
  }

  bool? get nextpage => _nextpage;

  set nextpage(bool? value) {
    _nextpage = value;
    notifyListeners();
  }


}