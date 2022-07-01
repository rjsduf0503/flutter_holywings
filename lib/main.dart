// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './pages/home/home.dart' as Home;
import './pages/profile/profile.dart' as Profile;

void main() {
  runApp(const MyApp());
}

class Item {
  String url, name;
  Item({required this.url, required this.name});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holywings clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.grey[850],
        // primarySwatch: Colors.grey,
        // backgroundColor: Colors.grey[850],
      ),
      home: BottomNavigator(),
    );
  }
}

class BottomNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Widget> _widgetOptions = [
    Home.HomeWidget(),
    Text('Events'),
    Profile.ProfileWidget(),
  ];

  TabBar get _tabBar => TabBar(
      labelColor: Colors.amber[300],
      unselectedLabelColor: Colors.grey[400],
      tabs: [
        Tab(text: 'Home', icon: Icon(Icons.home)),
        Tab(text: 'Events', icon: Icon(Icons.event)),
        Tab(text: 'Profile', icon: Icon(Icons.person)),
      ],
      padding: EdgeInsets.only(bottom: 20),
      indicatorColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: _widgetOptions,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Material(
          color: Colors.grey[800],
          child: _tabBar,
        ),
      ),
    );
  }
}
