class SubjectModel{
  String? _id;
  String? _subName;
  String? _totalMarks;
  String? _teacherId;


  String? get id => _id;


  set id(String? value) {
    _id = value;
  }

  String? get subName => _subName;

  String? get teacherId => _teacherId;

  set teacherId(String? value) {
    _teacherId = value;
  }

  String? get totalMarks => _totalMarks;

  set totalMarks(String? value) {
    _totalMarks = value;
  }

  set subName(String? value) {
    _subName = value;
  }


  SubjectModel(
      this._id, this._subName, this._totalMarks, this._teacherId);

  SubjectModel.empty();

  SubjectModel.forStandardScreen(this._id,this._subName,this._totalMarks);


  @override
  String toString() {
    return 'SubjectModel{_id: $_id, _subName: $_subName, _totalMarks: $_totalMarks, _teacherId: $_teacherId}';
  }

  SubjectModel.forStudents(this._id,this._subName,this._totalMarks);

  factory SubjectModel.fromJson(Map<String, dynamic> json){
    return SubjectModel(json["_id"], json["sub_name"], json["total_marks"].toString(), (json["teacher"] != null)?json["teacher"]["name"]:'Unassigned');
  }
}