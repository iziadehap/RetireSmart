class InflationModel {
  List<Estimate>? estimates;
  Params? params;
  List<String>? sources;
  String? disclaimer;

  InflationModel({this.estimates, this.params, this.sources, this.disclaimer});

  InflationModel.fromJson(Map<String, dynamic> json) {
    if (json['estimates'] != null) {
      estimates = <Estimate>[];
      json['estimates'].forEach((v) {
        estimates!.add(Estimate.fromJson(v));
      });
    }
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    sources = json['sources'].cast<String>();
    disclaimer = json['disclaimer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estimates != null) {
      data['estimates'] = estimates!.map((v) => v.toJson()).toList();
    }
    if (params != null) {
      data['params'] = params!.toJson();
    }
    data['sources'] = sources;
    data['disclaimer'] = disclaimer;
    return data;
  }
}

class Estimate {
  int? year;
  double? inflation;

  Estimate({this.year, this.inflation});

  Estimate.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    inflation = json['inflation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['inflation'] = inflation;
    return data;
  }
}

class Params {
  int? years;
  String? risk;

  Params({this.years, this.risk});

  Params.fromJson(Map<String, dynamic> json) {
    years = json['years'];
    risk = json['risk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['years'] = years;
    data['risk'] = risk;
    return data;
  }
}
