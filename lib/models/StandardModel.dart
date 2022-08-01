import 'SubjectModel.dart';

class StandardModel{
  String? _id;
  String? _std_name;
  List<SubjectModel>? _subjects;


  String? get id => _id;

  set id(String? value) {
    _id = value;
  }



  String? get std_name => _std_name;

  set std_name(String? value) {
    _std_name = value;
  }

  List<SubjectModel>? get subjects => _subjects;

  set subjects(List<SubjectModel>? value) {
    _subjects = value;
  }

  StandardModel(this._id, this._std_name, this._subjects);
}