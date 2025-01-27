import 'package:flutter/material.dart';
import 'package:weview/screens/main_layout.dart';
import 'package:weview/screens/notifications_screen.dart'; // 공지사항 화면 import

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   title: 'WeView',
   theme: ThemeData(
    primarySwatch: Colors.blue,
   ),
   debugShowCheckedModeBanner: false, // DEBUG 띠 제거
   initialRoute: '/', // 기본 경로 설정
   routes: {
    '/': (context) => MainLayout(),
    '/notifications': (context) => NotificationsScreen(), // 공지사항 경로 추가
   },
   builder: (context, child) {
    return GestureDetector(
     onTap: () {
      // 화면 터치 시 키보드 숨기기
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
       currentFocus.unfocus();
      }
     },
     child: child,
    );
   },
  );
 }
}
