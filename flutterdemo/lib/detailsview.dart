import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: camel_case_types
class detailsview extends StatelessWidget {

  
  final String id, url, name, password, email;
  const detailsview(
      {Key? key,
      required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(url);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            color: Color.fromARGB(255, 130, 236, 228),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ID: " + id, style: const TextStyle(color: Color.fromARGB(255, 33, 141, 66))),
                Text("Name: " + name,
                    style: const TextStyle(color: Color.fromARGB(255, 33, 141, 66))),
                Text("Password: " + password,
                    style: const TextStyle(color: Color.fromARGB(255, 33, 141, 66))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Email: " + email,
                        style: const TextStyle(color: Color.fromARGB(255, 33, 141, 66))),
                    Image.network(
                      url,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Linkify(
              onOpen: _onOpen,
              textScaleFactor: 2,
              text: "Photo Url: " + url,
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
}