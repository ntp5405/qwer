import 'dart:html';
import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterdemo/gridview.dart';
import 'package:flutterdemo/listviewpage.dart';

import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'search_field.dart';
import 'section_title.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'getdata.dart';
import 'home_header.dart';
import 'icon_btn_with_counter.dart';
import 'special_offers..dart';

// ignore: camel_case_types
class viewuser extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const viewuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            HomeHeader(),
            SizedBox(height: 20),
            DiscountBanner(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 20),            
            SpecialOffers(),
            SizedBox(height: 20),
            SectionTitle(
              text: "Popular Product", 
              press: () {},
            )
          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   final LocalStorage storage = LocalStorage('localstorage_app');
  //   final token = storage.getItem('Token');
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(token),

  //       actions: [
  //         // Navigate to the Search Screen
  //         IconButton(
  //             onPressed: () => Navigator.of(context),
  //             icon: const Icon(Icons.settings))
  //       ],
  //     ),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           // Navigator.pop(context);
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (BuildContext context) => const listviewpage()));
  //         },
  //         child: const Text('Get all users'),
  //       ),
  //     ),

  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         ChangeNotifierProvider(
  //           create: (context) => getdata(),
  //           builder: (context, child) {
  //             return const gridview();
  //           },
  //         );
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (BuildContext context) => const gridview()));
  //         // Add your onPressed code here!
  //       },
  //       backgroundColor: Color.fromARGB(255, 76, 160, 175),
  //       child: const Icon(Icons.navigation),
  //     ),
  //   );
  // }
}

