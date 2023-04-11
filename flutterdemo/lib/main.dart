import 'package:flutter/material.dart';
import 'package:flutterdemo/viewuser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'getdata.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => getdata())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<http.Response> login() {
    return http.post(
      Uri.parse('http://restapi.adequateshop.com/api/authaccount/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': nameController.text,
        'password': passwordController.text
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: 'abcd@abc.com');
    passwordController = TextEditingController(text: '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Phần mềm quản lý cửa hàng kinh doanh mô hình đồ chơi PVB',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    http.Response response = await login();
                    final body = json.decode(response.body);
                    debugPrint(response.body);
                    final LocalStorage storage =
                        LocalStorage('localstorage_app');

                    if (body['message'] == 'success') {
                      //Token is nested inside data field so it goes one deeper.
                      final String token = body['data']['Token'];
                      // debugPrint(token);
                      // ignore: unused_element
                      debugPrint("Token: $token");
                      storage.setItem('Token', token);
                      storage.setItem('username', nameController.text);
                      storage.setItem('password', passwordController.text);
                      //debugPrint(info)
;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const viewuser()));
                    } 
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Wrong email or password'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Code to execute.
                            },
                          ),
                        ),
                      );
                    }
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}