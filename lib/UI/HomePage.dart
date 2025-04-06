import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter News App'),
        bottom: TabBar(
            tabs: [
              Tab( text:"Breaking"),
              Tab(text:"All news")
        ]),
      ),
      body: TabBarView(children:
          [


          ]),
    ));
  }
}
