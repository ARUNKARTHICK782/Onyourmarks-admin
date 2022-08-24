class MarksModel{
  String? _exam_id;
  String? _exam_name;
  String? _sub_name;
  String? _total_marks;
  String? _obtained_marks;
  String? _date;


  String? get date => _date;

  set dates(String? value) {
    _date = value;
  }

  String? get exam_id => _exam_id;

  set exam_id(String? value) {
    _exam_id = value;
  }

  String? get exam_name => _exam_name;

  String? get obtained_marks => _obtained_marks;

  set obtained_marks(String? value) {
    _obtained_marks = value;
  }

  String? get total_marks => _total_marks;

  set total_marks(String? value) {
    _total_marks = value;
  }

  String? get sub_name => _sub_name;

  set sub_name(String? value) {
    _sub_name = value;
  }

  set exam_name(String? value) {
    _exam_name = value;
  }

  MarksModel(this._exam_id, this._exam_name, this._sub_name, this._total_marks,
      this._obtained_marks, this._date);
}