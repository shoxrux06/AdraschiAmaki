// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  List<District> region;
  List<Country> country;
  List<District> district;

  Address({
    required this.region,
    required this.country,
    required this.district,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    region: List<District>.from(json["REGION"].map((x) => District.fromJson(x))),
    country: List<Country>.from(json["COUNTRY"].map((x) => Country.fromJson(x))),
    district: List<District>.from(json["DISTRICT"].map((x) => District.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "REGION": List<dynamic>.from(region.map((x) => x.toJson())),
    "COUNTRY": List<dynamic>.from(country.map((x) => x.toJson())),
    "DISTRICT": List<dynamic>.from(district.map((x) => x.toJson())),
  };
}

class Country {
  int id;
  String code;
  String alpha2Code;
  String alpha3Code;
  String name;
  String currency;
  int localSign;
  String dateActiv;
  dynamic dateDeact;
  String condition;
  String uzc;
  String uzl;
  String rus;

  Country({
    required this.id,
    required this.code,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.name,
    required this.currency,
    required this.localSign,
    required this.dateActiv,
    this.dateDeact,
    required this.condition,
    required this.uzc,
    required this.uzl,
    required this.rus,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    code: json["code"],
    alpha2Code: json["alpha2Code"],
    alpha3Code: json["alpha3Code"],
    name: json["name"],
    currency: json["currency"],
    localSign: json["localSign"],
    dateActiv: json["dateActiv"],
    dateDeact: json["dateDeact"],
    condition: json["condition"],
    uzc: json["uzc"],
    uzl: json["uzl"],
    rus: json["rus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "alpha2Code": alpha2Code,
    "alpha3Code": alpha3Code,
    "name": name,
    "currency": currency,
    "localSign": localSign,
    "dateActiv": dateActiv,
    "dateDeact": dateDeact,
    "condition": condition,
    "uzc": uzc,
    "uzl": uzl,
    "rus": rus,
  };
}

class District {
  int id;
  String code;
  String name;
  String? region;
  String dateActiv;
  dynamic dateDeact;
  Condition condition;
  String uzc;
  String uzl;
  String rus;
  int? order;

  District({
    required this.id,
    required this.code,
    required this.name,
    this.region,
    required this.dateActiv,
    this.dateDeact,
    required this.condition,
    required this.uzc,
    required this.uzl,
    required this.rus,
    this.order,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    region: json["region"],
    dateActiv: json["dateActiv"],
    dateDeact: json["dateDeact"],
    condition: conditionValues.map[json["condition"]]!,
    uzc: json["uzc"],
    uzl: json["uzl"],
    rus: json["rus"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "region": region,
    "dateActiv": dateActiv,
    "dateDeact": dateDeact,
    "condition": conditionValues.reverse[condition],
    "uzc": uzc,
    "uzl": uzl,
    "rus": rus,
    "order": order,
  };
}

enum Condition { A }

final conditionValues = EnumValues({
  "A": Condition.A
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
