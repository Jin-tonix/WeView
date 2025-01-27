import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final String title;
  final String content;

  PostDetailScreen({required this.title, required this.content});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  // 댓글 데이터 구조: 댓글과 대댓글이 재귀적으로 포함됨
  List<Map<String, dynamic>> comments = [];

  // 댓글 입력 컨트롤러
  TextEditingController _commentController = TextEditingController();

  // 댓글 추가
  void _addComment(String text, List<Map<String, dynamic>> targetList) {
    if (text.isNotEmpty) {
      setState(() {
        targetList.add({'text': text, 'replies': <Map<String, dynamic>>[]});
      });
    }
  }

  // 대댓글 입력 다이얼로그
  void _showReplyDialog(List<Map<String, dynamic>> targetList) {
    TextEditingController replyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('답글 작성'),
          content: TextField(
            controller: replyController,
            decoration: InputDecoration(
              labelText: '답글을 입력하세요',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (replyController.text.isNotEmpty) {
                  _addComment(replyController.text, targetList);
                  Navigator.pop(context);
                }
              },
              child: Text('작성'),
            ),
          ],
        );
      },
    );
  }

  // 댓글/대댓글 위젯 생성 (재귀적으로 처리)
  Widget _buildCommentItem(Map<String, dynamic> comment, List<Map<String, dynamic>> replies) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 댓글 텍스트와 답글 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  comment['text'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(Icons.reply, color: Colors.grey),
                onPressed: () {
                  _showReplyDialog(replies);
                },
              ),
            ],
          ),
          // 대댓글 리스트 (재귀적으로 표시)
          if (replies.isNotEmpty)
            Column(
              children: replies.map((reply) {
                return _buildCommentItem(reply, reply['replies']);
              }).toList(),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 상세보기'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              widget.content,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: '댓글을 입력하세요',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _addComment(_commentController.text, comments);
                    _commentController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return _buildCommentItem(comment, comment['replies']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
