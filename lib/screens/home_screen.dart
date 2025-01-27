import 'package:flutter/material.dart';
import 'post_detail_screen.dart';
import 'write_post_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> notifications;

  HomeScreen({required this.notifications});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> posts = [
    {'title': '첫 번째 게시글입니다.', 'time': '2분 전', 'comments': 5},
    {'title': '두 번째 게시글입니다.', 'time': '10분 전', 'comments': 3},
    {'title': '세 번째 게시글입니다.', 'time': '1시간 전', 'comments': 8},
  ];

  void _addPost(String title) {
    setState(() {
      posts.insert(0, {
        'title': title,
        'time': '방금 전',
        'comments': 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 최신 공지사항 두 개 가져오기
    final latestNotices = widget.notifications.take(2).toList();

    return Scaffold(
      appBar: AppBar(
        title: latestNotices.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: latestNotices.map((notice) {
            return Text(
              notice['title'] ?? '공지사항 없음',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            );
          }).toList(),
        )
            : Text('공지사항 없음'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(
              post['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post['time'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    Icon(Icons.comment, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('${post['comments']}'),
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.push(

                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(title: post['title'], content: '',),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPostTitle = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WritePostScreen(),
            ),
          );

          if (newPostTitle != null && newPostTitle.isNotEmpty) {
            _addPost(newPostTitle);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
