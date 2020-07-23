import 'package:catcare_login/models/mock_posts.dart';
import 'package:flutter/material.dart';
import 'models/profile_data.dart';
import 'funding.dart';
import 'models/profile.dart';
import 'homepage.dart';
import 'setting.dart';

class MenuPage extends StatefulWidget {
  var userID;
  MenuPage(this.userID);
  @override
  _MenuPageState createState() => new _MenuPageState();
}

Drawer _buildDrawer() {
  return Drawer(
      child: ListView(
          children: <Widget>[DrawerHeader(child: Text('This is Menu'))]));
}

Drawer _buildEndDrawer() {
  return Drawer(
      child: ListView(
          children: <Widget>[DrawerHeader(child: Text('This is Setting'))]));
}

class _MenuPageState extends State<MenuPage> {
  String _currTitle = 'Welcome to Cat Community!';
  int _currIndex = 2;
  final List<Widget> _children = [
    PlaceholderWidgetFund(),
    PlaceholderWidgetFund(),
    HomePage(prof, mockData),
    PlaceholderWidgetFund(),
    PlaceholderWidgetFund(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currTitle),
        backgroundColor: Colors.cyan[100],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            //onPressed: () {Navigator.of(context).pushNamed('/setting');}
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage(userID: widget.userID,)),
              );
            },
          ),
        ],
      ),
      body: _children[_currIndex],
      drawer: _buildDrawer(),
      endDrawer: _buildEndDrawer(),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
                title: Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.cyan[100]),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.table_chart,
                  color: Colors.black,
                ),
                title: Text(
                  'Statistic',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.cyan[100]),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.cyan[100]),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.black,
                ),
                title: Text(
                  'Fund',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.cyan[100]),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                title: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.cyan[100]),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currIndex = index;
    });
  }
}
