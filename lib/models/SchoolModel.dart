class SchoolModel{
  String? _id;
  String? _school_name;
  String? _school_address;
  String? _state;
  String? _city;
  int? _noOfStudents;
  int? _noOfTeachers;


  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  SchoolModel(this._id, this._school_name, this._school_address, this._state,
      this._city, this._noOfStudents, this._noOfTeachers);

  String? get school_name => _school_name;

  set school_name(String? value) {
    _school_name = value;
  }

  String? get school_address => _school_address;

  set school_address(String? value) {
    _school_address = value;
  }

  String? get state => _state;

  set state(String? value) {
    _state = value;
  }

  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  int? get noOfStudents => _noOfStudents;

  set noOfStudents(int? value) {
    _noOfStudents = value;
  }

  int? get noOfTeachers => _noOfTeachers;

  set noOfTeachers(int? value) {
    _noOfTeachers = value;
  }



}