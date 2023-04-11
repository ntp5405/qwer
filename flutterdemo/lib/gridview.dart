import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'search.dart';

class gridview extends StatelessWidget {
  const gridview({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context),
              icon: const Icon(Icons.more_vert))
        ],),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children:        
        [
          
            Image.network('https://picsum.photos/250?image=1'),
            Image.network('https://picsum.photos/250?image=2'),
            Image.network('https://picsum.photos/250?image=3'),
            Image.network('https://picsum.photos/250?image=4'),
            Image.network('https://picsum.photos/250?image=5'),
            Image.network('https://picsum.photos/250?image=6'),
            Image.network('https://picsum.photos/250?image=7'),
            Image.network('https://picsum.photos/250?image=8'),
            Image.network('https://picsum.photos/250?image=9'),

        ]
      )
    );
    
  }
}