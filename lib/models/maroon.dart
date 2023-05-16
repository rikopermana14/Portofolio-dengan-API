// To parse this JSON data, do
//
//     final maroon = maroonFromJson(jsonString);

import 'dart:convert';

Maroon maroonFromJson(String str) => Maroon.fromJson(json.decode(str));

String maroonToJson(Maroon data) => json.encode(data.toJson());

class Maroon {
  int id;
  String name;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  Maroon({
    required this.id,
    required this.name,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Maroon.fromJson(Map<String, dynamic> json) => Maroon(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
