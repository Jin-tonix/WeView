import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  // 공지사항 데이터 (임시 데이터, 관리자 페이지에서 동적으로 가져오는 방식으로 변경 가능)
  final List<Map<String, String>> notifications = [
    {'title': '공지사항 1', 'content': '첫 번째 공지사항 내용입니다. 더 자세한 내용이 여기에 표시됩니다.'},
    {'title': '공지사항 2', 'content': '두 번째 공지사항 내용입니다. 공지사항은 관리자가 작성합니다.'},
    {'title': '공지사항 3', 'content': '세 번째 공지사항 내용입니다. 중요한 공지가 여기에 표시됩니다.'},
    {'title': '공지사항 4', 'content': '네 번째 공지사항 내용입니다. 새로운 업데이트가 포함됩니다.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
        backgroundColor: Colors.blue,
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
                  fontSize: 20, // 제목 글자 크기
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // 제목과 내용 간 간격
              Text(
                notification['content'] ?? '',
                style: TextStyle(
                  fontSize: 16, // 내용 글자 크기
                  color: Colors.grey[700], // 내용 글자 색상
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(height: 32, thickness: 1), // 공지사항 간 구분선
      ),
    );
  }
}
