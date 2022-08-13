import 'SubjectModel.dart';

class Exam{
  String? _id;
  String? _exam_name;
  String? _status;
  List<String>? _dates;
  String? _std_id;
  List<SubjectModel>? _subject_id;


  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get exam_name => _exam_name;

  set exam_name(String? value) {
    _exam_name = value;
  }

  String? get status => _status;

  set status(String? value) {
    _status = value;
  }

  List<SubjectModel>? get subject_id => _subject_id;

  set subject_id(List<SubjectModel>? value) {
    _subject_id = value;
  }

  String? get std_id => _std_id;

  set std_id(String? value) {
    _std_id = value;
  }

  List<String>? get dates => _dates;

  set dates(List<String>? value) {
    _dates = value;
  }


  @override
  String toString() {
    return 'Exam{_id: $_id, _exam_name: $_exam_name, _status: $_status, _dates: $_dates, _std_id: $_std_id, _subject_id: $_subject_id}';
  }

  Exam(this._id, this._exam_name, this._status,this._std_id ,this._dates, this._subject_id);

}