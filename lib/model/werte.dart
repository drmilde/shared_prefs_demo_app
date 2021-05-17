// To parse this JSON data, do
//
//     final werte = werteFromJson(jsonString);

import 'dart:convert';

Werte werteFromJson(String str) => Werte.fromJson(json.decode(str));

String werteToJson(Werte data) => json.encode(data.toJson());

class Werte {
  Werte({
    this.data,
    this.wert,
  });

  String data;
  int wert;

  factory Werte.fromJson(Map<String, dynamic> json) => Werte(
    data: json["data"],
    wert: json["wert"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "wert": wert,
  };
}
