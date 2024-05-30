import 'dart:convert';

class CotegorieModel {
    final int id;
    final String name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    CotegorieModel({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory CotegorieModel.fromRawJson(String str) => CotegorieModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CotegorieModel.fromJson(Map<String, dynamic> json) => CotegorieModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
