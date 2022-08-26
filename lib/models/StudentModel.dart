import 'package:onyourmarks/models/SubjectModel.dart';

class StudentModel{
  String? _id;
  String? _first_name;
  String? _last_name;
  String? _roll_no;
  String? _std_name;
  List<SubjectModel>? _subjects;
  String? _sub_id;
  String? _dob;
  String? _gender;
  String? _fatherName;
  String? _motherName;
  String? _occupation;
  int? _income;
  String? _email;
  int? _phno;
  String? _currentAddress;
  String? _permanentAddress;
  String? _motherTongue;
  String? _bloodGroup;
  String? _school_id;
  String? _std_id;


  String? get sub_id => _sub_id;

  set sub_id(String? value) {
    _sub_id = value;
  }

  String? get school_id => _school_id;

  set school_id(String? value) {
    _school_id = value;
  }

  List<SubjectModel>? get subjects => _subjects;

  set subjects(List<SubjectModel>? value) {
    _subjects = value;
  }

  String? get id => _id;

  set id(String? value){
    _id = value;
  }

  String? get name => _first_name;

  set name(String? value) {
    _first_name = value;
  }


  String? get first_name => _first_name;

  set first_name(String? value) {
    _first_name = value;
  }

  String? get roll_no => _roll_no;

  String? get bloodGroup => _bloodGroup;

  set bloodGroup(String? value) {
    _bloodGroup = value;
  }

  String? get motherTongue => _motherTongue;

  set motherTongue(String? value) {
    _motherTongue = value;
  }

  String? get permanentAddress => _permanentAddress;

  set permanentAddress(String? value) {
    _permanentAddress = value;
  }

  String? get currentAddress => _currentAddress;

  set currentAddress(String? value) {
    _currentAddress = value;
  }

  int? get phno => _phno;

  set phno(int? value) {
    _phno = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  int? get income => _income;

  set income(int? value) {
    _income = value;
  }

  String? get occupation => _occupation;

  set occupation(String? value) {
    _occupation = value;
  }

  String? get motherName => _motherName;

  set motherName(String? value) {
    _motherName = value;
  }

  String? get fatherName => _fatherName;

  set fatherName(String? value) {
    _fatherName = value;
  }

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
  }

  String? get dob => _dob;

  set dob(String? value) {
    _dob = value;
  }

  String? get std_id => _std_name;

  set std_id(String? value) {
    _std_name = value;
  }

  set roll_no(String? value) {
    _roll_no = value;
  }

  StudentModel(this._id,this._first_name,this._last_name, this._roll_no, this._std_name,this._subjects, this._dob, this._gender,
      this._fatherName, this._motherName, this._occupation, this._income,
      this._email, this._phno, this._currentAddress, this._permanentAddress,
      this._motherTongue, this._bloodGroup);

  StudentModel.empty();

  StudentModel.forCCA(this._id,this._roll_no,this._first_name,this._last_name);

  StudentModel.forSuperAdmin(this._id,this._first_name,this._last_name, this._roll_no,this._std_id, this._dob, this._gender,
      this._fatherName, this._motherName, this._occupation, this._income,
      this._email, this._phno, this._currentAddress, this._permanentAddress,
      this._motherTongue, this._bloodGroup,this._school_id);

  // factory StudentModel.fromJson(Map<String, dynamic> json){
  //     return StudentModel(json["_id"],json["first_name"],json["last_name"],json["roll_no"],json["std_id"]["std_name"],json["dob"],json["gender"],json["parent1name"],json["parent2name"],
  //       json["occupation"],json["income"],json["email"],json["phoneNo"],json["currentAddress"],json["permanentAddress"],json["motherTongue"],json["bloodGroup"]
  //     );
  // }

  String? get last_name => _last_name;

  set last_name(String? value) {
    _last_name = value;
  }

  String? get std_name => _std_name;

  set std_name(String? value) {
    _std_name = value;
  }

  @override
  String toString() {
    return 'StudentModel{_id: $_id, _first_name: $_first_name, _last_name: $_last_name, _roll_no: $_roll_no, _std_name: $_std_name, _dob: $_dob, _gender: $_gender, _fatherName: $_fatherName, _motherName: $_motherName, _occupation: $_occupation, _income: $_income, _email: $_email, _phno: $_phno, _currentAddress: $_currentAddress, _permanentAddress: $_permanentAddress, _motherTongue: $_motherTongue, _bloodGroup: $_bloodGroup}';
  }
}