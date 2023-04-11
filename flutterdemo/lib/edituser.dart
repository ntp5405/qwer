import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import 'getdata.dart';

// ignore: camel_case_types
class edituser with ChangeNotifier {
  ListData user;
  edituser(this.user);

  Future getListData() async {
    final LocalStorage storage = LocalStorage('localstorage_app');
    final token = storage.getItem('Token');
    Map<String, String> headera = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
    };
    debugPrint("Token: beforeget $token");
    var url =
        // ignore: prefer_adjacent_string_concatenation
        Uri.parse('http://restapi.adequateshop.com/api/users/' + "${user.id}");
    http.Response response = await http.post(url, headers: headera);
    if (response.statusCode != 200) {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
    debugPrint(response.body);
    var jsonData = json.decode(response.body);
    List<ListData> data = [];
    for (var user in jsonData['data']) {
      ListData list = ListData(user["id"], user["name"], user["email"],
          user["password"], user["url"]);
      data.add(list);
    }

    notifyListeners();
    return data;
  }
}