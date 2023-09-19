

import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/createExam.dart';
import 'package:grade_ease_app/screens/adminMode/dashboard.dart';
import 'package:grade_ease_app/screens/adminMode/registerUser.dart';
import 'package:grade_ease_app/screens/adminMode/scheduleInterview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index of the currently selected tab
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  // List of pages to display in the PageView
  final List<Widget> _pages = [
    DashBoard(),
    RegisterUser(),
    CreateExam(),
    ScheduleInterview(),
  ];

  // Function to handle tab changes
  void _onTabTapped(int index) {
  setState(() {
    _currentIndex = index;
    _pageController.jumpToPage(index);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left drawer-like tab bar
          Container(
            height: MediaQuery.of(context).size.height,
            width: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text('Dashboard'),
                  leading: Icon(Icons.person),
                  selected: _currentIndex == 0,
                  onTap: () => _onTabTapped(0),
                ),
                ListTile(
                  title: Text('Register Users'),
                  leading: Icon(Icons.person),
                  selected: _currentIndex == 1,
                  onTap: () => _onTabTapped(1),
                ),
                ListTile(
                  title: Text('Create Exams'),
                  leading: Icon(Icons.person),
                  selected: _currentIndex == 2,
                  onTap: () => _onTabTapped(2),
                ),
                ListTile(
                  title: Text('Schedule Interview'),
                  leading: Icon(Icons.person),
                  selected: _currentIndex == 3,
                  onTap: () => _onTabTapped(3),
                ),
              ],
            ),
          ),
          // Right PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: _onTabTapped,
            ),
          ),
        ],
      ),
    );
  }
}
