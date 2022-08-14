class EventModel{
  String? _id;
  String? _event_name;
  String? _event_description;
  String? _banner_img_url;
  String? _start_date;
  String? _end_date;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get event_name => _event_name;

  String? get end_date => _end_date;

  set end_date(String? value) {
    _end_date = value;
  }

  String? get start_date => _start_date;

  set start_date(String? value) {
    _start_date = value;
  }

  String? get banner_img_url => _banner_img_url;

  set banner_img_url(String? value) {
    _banner_img_url = value;
  }

  String? get event_description => _event_description;

  set event_description(String? value) {
    _event_description = value;
  }

  set event_name(String? value) {
    _event_name = value;
  }

  EventModel(this._id, this._event_name, this._event_description,
      this._banner_img_url, this._start_date, this._end_date);

  @override
  String toString() {
    return 'Event{_id: $_id, _event_name: $_event_name, _event_description: $_event_description, _banner_img_url: $_banner_img_url, _start_date: $_start_date, _end_date: $_end_date}';
  }
}