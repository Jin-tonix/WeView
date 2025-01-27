import 'package:flutter/material.dart';

class WritePostScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 글 작성'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 글 제목 입력 필드
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '글 제목을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // 글 내용 입력 필드
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: '글 내용을 입력하세요',
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // 다중 행 입력 가능
            ),
            SizedBox(height: 20),
            // 완료 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  final content = _contentController.text;

                  if (title.isEmpty || content.isEmpty) {
                    // 제목이나 내용이 비어있으면 경고 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('제목과 내용을 모두 입력해주세요.')),
                    );
                  } else {
                    // 제목과 내용을 함께 반환
                    Navigator.pop(context, {'title': title, 'content': content});
                  }
                },
                child: Text('완료'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
