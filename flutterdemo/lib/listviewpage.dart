import 'package:flutter/material.dart';
import 'package:flutterdemo/detailsView.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'editview.dart';
import 'getdata.dart';
import 'search.dart';


// ignore: camel_case_types
class listviewpage extends StatefulWidget {
  const listviewpage({Key? key}) : super(key: key);

  @override
  State<listviewpage> createState() => _listviewpageState();
}


// ignore: camel_case_types
class _listviewpageState extends State<listviewpage> {
  Future<http.Response> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://restapi.adequateshop.com/api/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  @override
  void initState() {
    var fetchData = Provider.of<getdata>(context, listen: false);
    fetchData.getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<getdata>().getListData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Page"),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Center(
          child: Consumer<getdata>(builder: (context, value, child) {
            return value.data.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: value.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text("${value.data[i].id}"),
                        subtitle: Text(value.data[i].name ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => detailsview(
                                              id: ("${value.data[i].id}"),
                                              url: (value
                                                      .data[i].profilepicture ??
                                                  ""),
                                              name: (value.data[i].name ?? ""),
                                              email:
                                                  (value.data[i].email ?? ""),
                                              password:
                                                  (value.data[i].password ??
                                                      ""))));
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              editview(
                                                  id: (value.data[i].id),
                                                  url: (value.data[i]
                                                          .profilepicture ??
                                                      ""),
                                                  name: (value.data[i].name ??
                                                      ""),
                                                  email: (value.data[i].email ??
                                                      ""),
                                                  password:
                                                      (value.data[i].password ??
                                                          ""))));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('DELETE'),
                                          content: const Text(
                                              'Do you want to delete this user?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'Yes'),
                                              child: const Text('YES'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'No'),
                                              child: const Text('NO'),
                                            ),
                                          ],
                                        )),
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      );
                    });
          }),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    await context.read<getdata>().getListData();

    setState(() {});
  }
}
