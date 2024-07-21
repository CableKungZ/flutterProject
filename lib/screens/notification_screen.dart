// File: main3.dart

import 'package:flutter/material.dart';

class NotiScreen extends StatefulWidget {
  @override
  _NotiScreen createState() => _NotiScreen();
}

class _NotiScreen extends State<NotiScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/search');
        break;
      case 2:
        Navigator.pushNamed(context, '/notification');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.grey),
            ),
            SizedBox(width: 10),
            Text('John Doe S123456789'),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200], // เพิ่มสีพื้นหลังเทาอ่อน
        child: ListView(
          children: [
            EventCard(
              imagePath: 'assets/img/event_image_1.jpg',
              title: 'กิจกรรมที่ใกล้จะมาถึงเร็วๆนี้ !!!',
              description: 'เข้าร่วมและชียร์! วันจันทร์ที่ 22 กรกฎาคม 2567',
            ),
            EventCard(
              imagePath: 'assets/img/event_image_2.png',
              title: 'กิจกรรมที่ใกล้จะมาถึงเร็วๆนี้ !!!',
              description: '4.8 KM วันจันทร์ที่ 22 กรกฎาคม 2567',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  EventCard(
      {required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red),
                ),
                SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text('รายละเอียดเพิ่มเติม',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_outlined, color: Colors.red),
                      onPressed: () {
                        // Handle notification button press
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
