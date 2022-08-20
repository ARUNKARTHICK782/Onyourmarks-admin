class AttendanceModel{
  String? _id;
  String? _first_name;
  String? _last_name;
  String? _roll_no;
  String? _std_name;
  List<dynamic>? _dates;

  AttendanceModel(this._id, this._first_name, this._last_name, this._roll_no,
      this._std_name,this._dates);

  List<dynamic>? get dates => _dates;

  set dates(List<dynamic>? value){
    _dates = value;
  }

  String? get std_name => _std_name;

  set std_name(String? value) {
    _std_name = value;
  }

  String? get roll_no => _roll_no;

  set roll_no(String? value) {
    _roll_no = value;
  }

  String? get last_name => _last_name;

  set last_name(String? value) {
    _last_name = value;
  }

  String? get first_name => _first_name;

  set first_name(String? value) {
    _first_name = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  @override
  String toString() {
    return 'AttendanceModel{_id: $_id, _first_name: $_first_name, _last_name: $_last_name, _roll_no: $_roll_no, _std_name: $_std_name, _dates: $_dates}';
  }
}