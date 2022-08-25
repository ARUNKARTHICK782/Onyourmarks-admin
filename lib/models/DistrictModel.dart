import 'package:onyourmarks/models/SchoolModel.dart';

class DistrictModel{
  String? _id;
  String? _district_name;
  String? _state;
  SchoolModel? schoolModel;

  DistrictModel(this._id, this._district_name, this._state, this.schoolModel);

  String? get state => _state;

  set state(String? value) {
    _state = value;
  }

  String? get district_name => _district_name;

  set district_name(String? value) {
    _district_name = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }
}