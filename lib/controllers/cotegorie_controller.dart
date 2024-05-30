import 'dart:convert';
import 'package:dars6/models/cotegorie.dart';
import 'package:http/http.dart' as http;

class SecondController {
  List<CotegorieModel> _list = [];
  List<CotegorieModel> get list => [..._list];

  Future<List<CotegorieModel>> getInfo() async {
    var data =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    List json = jsonDecode(data.body);
    List<CotegorieModel> listtemp = [];

    for (var item in json) {
      listtemp.add(CotegorieModel(
        id: item["id"],
        name: item["name"],
        image: item["image"],
        creationAt: DateTime.parse(item["creationAt"]),
        updatedAt: DateTime.parse(item["updatedAt"]),
      ));
    }

    return listtemp;
  }
}
