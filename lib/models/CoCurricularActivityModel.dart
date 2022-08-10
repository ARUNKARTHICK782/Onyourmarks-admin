import 'package:onyourmarks/models/StudentModel.dart';

class CoCurricularActivityModel{
    String? _id;
    String? _activity_name;
    String? _activity_type;
    String? _status;
    String? _startDate;
    String? _endDate;
    String? _isVerified;
    StudentModel? _student;
    String? _std_name;

    String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get activity_name => _activity_name;

  set activity_name(String? value){
    _activity_name = value;
  }


    String? get std_name => _std_name;

  set std_name(String? value) {
    _std_name = value;
  }

  String? get activity_type => _activity_type;

    set activity_type(String? value) {
      _activity_type = value;
    }



  String? get status => _status;

    set status(String? value) {
      _status = value;
    }

    String? get startDate => _startDate;

    set startDate(String? value) {
      _startDate = value;
    }

    String? get endDate => _endDate;

    set endDate(String? value) {
      _endDate = value;
    }

    String? get isVerified => _isVerified;

    set isVerified(String? value) {
      _isVerified = value;
    }

    StudentModel? get student => _student;

    set student(StudentModel? value) {
      _student = value;
    }

    CoCurricularActivityModel.empty();

    CoCurricularActivityModel(
      this._id,
      this._activity_name,
      this._activity_type,
      this._status,
      this._startDate,
      this._endDate,
      this._isVerified,
      this._student,
      this._std_name );
}