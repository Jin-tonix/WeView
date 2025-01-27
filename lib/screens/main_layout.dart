import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<String> appBarTitles = ['홈', '리뷰', '커뮤니티', '더보기'];
  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Place Reviews Screen', style: TextStyle(fontSize: 18))),
    Center(child: Text('Community Screen', style: TextStyle(fontSize: 18))),
    Center(child: Text('More Screen', style: TextStyle(fontSize: 18))),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 공지사항 아이콘
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              tooltip: '공지사항',
            ),
            // 로고 가운데 정렬
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 30,
                ),
              ),
            ),
            // 검색 아이콘
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
              tooltip: '검색',
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // 변경된 색상
        backgroundColor: Colors.white, // 배경색 설정
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Reviews'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 12), // 선택된 라벨 스타일
        unselectedLabelStyle: TextStyle(fontSize: 10), // 선택되지 않은 라벨 스타일
      ),
    );
  }
}
