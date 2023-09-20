import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 이미지 중앙 배치
            Image.asset(
              'assets/images/pt.sd.png', // 이미지 경로
              width: 500.0,
              height: 500.0,
            ),
            SizedBox(height: 20.0), // 간격 조절

            // 사각형 버튼
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 다른 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
              child: Text('시작하기'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다음 페이지'),
      ),
      body: Center(
        child: Text('다음 페이지 내용'),
      ),
    );
  }
}
