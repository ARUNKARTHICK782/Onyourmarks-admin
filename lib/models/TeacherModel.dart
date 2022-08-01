import 'dart:core';

class TeacherModel{
  String? _id;
  String? _name ;
  String? _degree;
  String? _dob;
  String? _gender;
  String? _email;
  String? _phoneNo;
  String? _currentAddress;
  String? _permanentAddress;
  String? _motherTongue;
  String? _bloogGroup;
  String? _salary;
  String? _status;
  String? _chat_id;
  String? _subject_name;
  String? _sub_id;
  List<String>? _std_ids;

  set subject_name(String? value){
    _subject_name = value;
  }
  String? get subject_name => _subject_name;

  String? get chat_id => _chat_id;

  set chat_id(String? value) {
    _chat_id = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get status => _status;

  set status(String? value) {
    _status = value;
  }

  String? get salary => _salary;

  set salary(String? value) {
    _salary = value;
  }

  String? get bloogGroup => _bloogGroup;

  set bloogGroup(String? value) {
    _bloogGroup = value;
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

  String? get phoneNo => _phoneNo;

  set phoneNo(String? value) {
    _phoneNo = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
  }

  String? get dob => _dob;

  set dob(String? value) {
    _dob = value;
  }

  String? get degree => _degree;

  set degree(String? value) {
    _degree = value;
  }


  String? get sub_id => _sub_id;

  set sub_id(String? value) {
    _sub_id = value;
  }

  List<String>? get std_ids => _std_ids;

  set std_ids(List<String>? value) {
    _std_ids = value;
  }


  @override
  String toString() {
    return 'TeacherModel{_id: $_id, _name: $_name, _degree: $_degree, _dob: $_dob, _gender: $_gender, _email: $_email, _phoneNo: $_phoneNo, _currentAddress: $_currentAddress, _permanentAddress: $_permanentAddress, _motherTongue: $_motherTongue, _bloogGroup: $_bloogGroup, _salary: $_salary, _status: $_status, _chat_id: $_chat_id, _subject_name: $_subject_name, _sub_id: $_sub_id, _std_ids: $_std_ids}';
  }

  TeacherModel(
      this._id,
      this._name,
      this._degree,
      this._dob,
      this._gender,
      this._email,
      this._phoneNo,
      this._currentAddress,
      this._permanentAddress,
      this._motherTongue,
      this._bloogGroup,
      this._salary,
      this._status);

  TeacherModel.addTeacher(
      this._name,
      this._degree,
      this._dob,
      this._gender,
      this._email,
      this._phoneNo,
      this._currentAddress,
      this._permanentAddress,
      this._motherTongue,
      this._bloogGroup,
      this._salary,
      this._status,
      this._sub_id,
      this._std_ids
      );

  TeacherModel.editTeacher(
      this._id,
      this._name,
      this._degree,
      this._dob,
      this._gender,
      this._email,
      this._phoneNo,
      this._currentAddress,
      this._permanentAddress,
      this._motherTongue,
      this._bloogGroup,
      this._salary,
      this._status,
      );

  TeacherModel.forChat(this._id,this._name,this._chat_id);

  TeacherModel.forStudents(this._id,this._name,this._subject_name);


  factory TeacherModel.fromJson(Map<String,dynamic> json){
    return TeacherModel(json["_id"], json["name"], json["degree"], json["dob"], json["gender"], json["email"], json["phoneNo"].toString(), json["currentAddress"], json["permanentAddress"], json["motherTongue"], json["bloodGroup"], json["salary"].toString(), json["status"]);
  }


}