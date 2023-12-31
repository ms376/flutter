import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex50 Http Exam Naver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '내용을 입력하세요.',
              style: TextStyle(fontSize: 30.0),
            ),
            TextField(
              maxLength: 10,
              maxLines: 2,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                counterStyle: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              onChanged: (text1) {
                text = text1;
                print('$text1');
              },
              onSubmitted: (text) {
                print('Submitted : $text');
              },
            ),
            ElevatedButton(
              child: const Text('Http (Get)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _getRequest();
              },
            )
          ],
        ),
      ),
    );
  }

  void _getRequest() async {
    
    String str = Uri.encodeQueryComponent('$text');
    String url = 'https://openapi.naver.com/v1/search/news.json';
    String opt = '&display=50&sort=sim';

    var regUrl = Uri.parse("$url?query=$str$opt");
    print(regUrl);
    http.Response response = await http.get(regUrl, headers: {
      "X-Naver-Client-Id":"G44PuZcfbJ6g9Fe7xR9o",
      "X-Naver-Client-Secret":"zLaiWMhjs8"
    });
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
  }
}
// statusCode : 200 => 제대로옴
// 404 경로
// 403 로긴정보에러
// 401 인증에러
// 500 에러