import 'dart:convert';
import 'package:dars6/models/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  List<UserModel> _list = [];
  List<UserModel> get list => [..._list];

  Future<List<UserModel>> getInfo() async {
    var data =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users"));
    List json = jsonDecode(data.body);
    List<UserModel> listtemp = [];
    for (var item in json) {
      listtemp.add(UserModel(
        id: item["id"],
        email: item["email"],
        password: item["password"],
        name: item["name"],
        role: roleValues.map[item["role"]]!,
        avatar: item["avatar"],
        creationAt: DateTime.parse(item["creationAt"]),
        updatedAt: DateTime.parse(item["updatedAt"]),
      ));
    }

    return listtemp;
  }

}
