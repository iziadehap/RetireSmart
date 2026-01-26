import 'package:hive/hive.dart';

part 'inflation_model.g.dart';

@HiveType(typeId: 5)
class InflationModel {
  @HiveField(0)
  List<Estimate>? estimates;
  @HiveField(1)
  Params? params;
  @HiveField(2)
  List<String>? sources;
  @HiveField(3)
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

@HiveType(typeId: 6)
class Estimate {
  @HiveField(0)
  int? year;
  @HiveField(1)
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

@HiveType(typeId: 7)
class Params {
  @HiveField(0)
  int? years;
  @HiveField(1)
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
