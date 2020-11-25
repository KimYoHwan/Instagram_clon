import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/home_page..dart';
import 'package:instagram_clon/search_page.dart';

class TabPage extends StatefulWidget {
  final User user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex=  0;
  List _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home')),
        BottomNavigationBarItem(icon:Icon(Icons.search),title: Text('Search')),
        BottomNavigationBarItem(icon:Icon(Icons.account_circle),title: Text('Account')),
        ],
      onTap: _onItemTapped,),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

