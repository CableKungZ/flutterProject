import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<HomeScreen> {
  int _selectedIndex = 0;

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
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'John Doe 5123456789',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('กิจกรรมแนะนำ ▼', style: TextStyle(color: Colors.white)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('Option 1')),
              PopupMenuItem(child: Text('Option 2')),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          EventCard(
            title: 'เชิญชวนนักศึกษาและบุคลากร',
            imagePath: 'assets/images/event_image_1.jpg',
            description: 'รายละเอียดกิจกรรม...',
          ),
          EventCard(
            title: 'WU HAPPY FUNRUN#7',
            imagePath: 'assets/images/event_image_2.png',
            description: '4.8 KM วันอาทิตย์ที่ 25 กุมภาพันธ์ 2567',
          ),
        ],
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
  final String title;
  final String imagePath;
  final String description;

  EventCard({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(child: Text('Image not found')),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(description),
                SizedBox(height: 8),
                TextButton(
                  child: Text('รายละเอียดเพิ่มเติม'),
                  onPressed: () {
                    // Handle button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
