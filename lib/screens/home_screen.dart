import 'package:flutter/material.dart';
import 'post_detail_screen.dart';
import 'write_post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> posts = [
    {'title': '첫 번째 게시글입니다.', 'content': '첫 번째 글 내용입니다.', 'time': '2분 전', 'comments': 5},
    {'title': '두 번째 게시글입니다.', 'content': '두 번째 글 내용입니다.', 'time': '10분 전', 'comments': 3},
    {'title': '세 번째 게시글입니다.', 'content': '세 번째 글 내용입니다.', 'time': '1시간 전', 'comments': 8},
  ];

  void _addPost(String title, String content) {
    setState(() {
      posts.insert(0, {
        'title': title,
        'content': content,
        'time': '방금 전',
        'comments': 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(
                post['title'] ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post['time'] ?? '',
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
                    builder: (context) => PostDetailScreen(
                      title: post['title'] ?? '',
                      content: post['content'] ?? '',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => WritePostScreen(),
            ),
          );

          if (newPost != null && newPost['title'] != null && newPost['title']!.isNotEmpty) {
            _addPost(newPost['title']!, newPost['content']!);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
