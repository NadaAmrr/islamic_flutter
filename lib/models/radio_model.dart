class RadioModel {
  RadioModel({
    List<Radios>? radios,
  }) {
    _radios = radios;
  }

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      _radios = [];
      json['radios'].forEach((v) {
        _radios?.add(Radios.fromJson(v));
      });
    }
  }
  List<Radios>? _radios;
  RadioModel copyWith({
    List<Radios>? radios,
  }) =>
      RadioModel(
        radios: radios ?? _radios,
      );
  List<Radios>? get radios => _radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_radios != null) {
      map['radios'] = _radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Radios {
  Radios({
    int? id,
    String? name,
    String? url,
    String? recentDate,
  }) {
    _id = id;
    _name = name;
    _url = url;
    _recentDate = recentDate;
  }

  Radios.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
    _recentDate = json['recent_date'];
  }
  int? _id;
  String? _name;
  String? _url;
  String? _recentDate;
  Radios copyWith({
    int? id,
    String? name,
    String? url,
    String? recentDate,
  }) =>
      Radios(
        id: id ?? _id,
        name: name ?? _name,
        url: url ?? _url,
        recentDate: recentDate ?? _recentDate,
      );
  int? get id => _id;
  String? get name => _name;
  String? get url => _url;
  String? get recentDate => _recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    map['recent_date'] = _recentDate;
    return map;
  }
}
