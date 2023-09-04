import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.green, //글자 색
        backgroundColor: Colors.white, //앱 바 색
        elevation: 2, //앱 바 밑에 음영 사라지게 만드는 코드
        title: Text("오늘의 웹툰",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}
