import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print("Menu button");
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('SHRINE'),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: IconButton(
                onPressed: () {
                  print("Search Button");
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                )),
          ),
        ],
      ),
      body: Center(child: Text('You did it!')),
    );
  }
}
