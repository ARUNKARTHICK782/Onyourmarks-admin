class CCAModel{
  String? _name;
  String? _type;
  String? _status;
  String? _startDate;
  String? _endDate;
  String? _isVerified;
  String? _id;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get type => _type;

  String? get isVerified => _isVerified;

  set isVerified(String? value) {
    _isVerified = value;
  }

  String? get endDate => _endDate;

  set endDate(String? value) {
    _endDate = value;
  }

  String? get startDate => _startDate;

  set startDate(String? value) {
    _startDate = value;
  }

  String? get status => _status;

  set status(String? value) {
    _status = value;
  }

  set type(String? value) {
    _type = value;
  }

  CCAModel(this._name, this._type, this._status, this._startDate, this._endDate,
      this._isVerified, this._id);

  factory CCAModel.fromJson(Map<String,dynamic> json){
    return CCAModel(json["activity_name"], json["activity_type"], json["status"], json["startDate"], json["endDate"], json["isVerified"],json["student_id"]);
  }
}