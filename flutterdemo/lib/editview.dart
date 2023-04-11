import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class editview extends StatefulWidget {
  final int id;
  final String url, name, password, email;
  const editview(
      {Key? key,
      required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.url})
      : super(key: key);

  @override
  State<editview> createState() => _editviewState();

  void setuser(String name) {}
  void setpassword(String password) {}
}

// ignore: camel_case_types
class _editviewState extends State<editview> {
  TextEditingController? _controller;
  TextEditingController? _passwordcontroller;

  set setuser(String name) {}
  set setpassword(String password) {}

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name);
    _controller?.addListener(() {
      final text = _controller == null ? "" : _controller!.text;
      widget.setuser(text);
    });
      
    _passwordcontroller = TextEditingController(text: widget.password);
    _passwordcontroller?.addListener(() {
      final text = _passwordcontroller == null ? "" : _passwordcontroller!.text;
      widget.setpassword(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300.0,
            width: 300.0,
            color:Color.fromARGB(255, 130, 236, 228),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ID: " + "${widget.id}",
                    style: const TextStyle(color: Color.fromARGB(255, 2, 58, 10))),
                TextField(
                  controller: _controller,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: "Name: ",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordcontroller,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: "Password: ",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Email: " + widget.email,
                        style: const TextStyle(color: Colors.black)),
                    // Text(
                    //   "Picture: " + Image.network(widget.url).toString(),
                    // )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Linkify(
              onOpen: _onOpen,
              textScaleFactor: 2,
              text: "Photo Url: " + widget.url,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      )),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunchUrlString(link.url)) {
      await launchUrlString(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  _save() async {
    debugPrint(_controller!.text);
    debugPrint(_passwordcontroller!.text);
    final LocalStorage storage = LocalStorage('localstorage_app');
    final token = storage.getItem('Token');
    Map<String, String> headera = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
    };
    // ignore: unused_local_variable, unnecessary_string_interpolations
    var url =
        Uri.parse("http://restapi.adequateshop.com/api/users/${widget.id}");
    var body = <String, String>{
      "id": "${widget.id}",
      "name": _controller!.text,
      "email": widget.email,
      "location": "USA"
    };

    debugPrint(url.toString());
    debugPrint(jsonEncode(body).toString());
    http.Response response = await http.put(
      url,
      headers: headera,
      body: jsonEncode(body),
    );
    if (response.statusCode != 200) {
      debugPrint("${response.statusCode}: ${response.body}");
      // throw Exception(
      //     "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
  }
}