import 'package:assignment5/Page/account.dart';
import 'package:assignment5/Page/dash.dart';
import 'package:assignment5/Page/home.dart';
import 'package:flutter/material.dart';


class navBarB extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<navBarB> {
  int _currentPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 5'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              // Perform settings action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center
                ,
                children: [
                  Text(
                    'Hello There',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),

            ), ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                _selectPage(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.dashboard),
              onTap: () {
                _selectPage(1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Account'),
              leading: Icon(Icons.account_box),
              onTap: () {
                _selectPage(2);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: [
          HomePage(),
          DashboardPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}