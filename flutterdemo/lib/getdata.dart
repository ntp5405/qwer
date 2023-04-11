import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

// ignore: camel_case_types
class getdata with ChangeNotifier {
  List<ListData> data = [];

  Future getListData() async {
    final LocalStorage storage = LocalStorage('localstorage_app');
    final token = storage.getItem('Token');
    Map<String, String> headera = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
    };
    debugPrint("Token: beforeget $token");
    var url = Uri.parse('http://restapi.adequateshop.com/api/users?page=1');
    http.Response response = await http.get(url, headers: headera);
    if (response.statusCode != 200) {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}"
           );
    }
    // debugPrint(response.body);
    var jsonData = json.decode(response.body);

    for (var user in jsonData['data']) {
      ListData list = ListData(user["id"], user["name"], user["email"],
          user["password"], user["url"]);
      data.add(list);
    }

    notifyListeners();
    return data;
  }
}

class ListData {
  final int id;
  String? name, email, password, url, profilepicture;

  ListData(this.id, this.name, this.email, this.password, this.url);
}
