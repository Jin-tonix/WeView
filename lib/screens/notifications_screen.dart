import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {'title': '공지사항 1', 'content': '첫 번째 공지사항 내용입니다.'},
    {'title': '공지사항 2', 'content': '두 번째 공지사항 내용입니다.'},
    {'title': '공지사항 3', 'content': '세 번째 공지사항 내용입니다.'},
    {'title': '공지사항 4', 'content': '네 번째 공지사항 내용입니다.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // 공지사항 데이터를 반환
              Navigator.pop(context, notifications);
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification['title'] ?? '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                notification['content'] ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(height: 32, thickness: 1),
      ),
    );
  }
}
