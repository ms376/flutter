import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

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
      // home: const MyHomePage(title: 'Ex41 Route'),
      initialRoute: '/page1',
      /* 
              home과 initalRoute를 동시에 사용하면 home은 무시된다.
              즉 우선순위가 느리므로 동시에 사용하지 않는다.
      */
      // home : Page1(title: '시작1'), // 앱 첫 실행시 첫페이지를 지정
      
      routes: { // 첫번째 페이지 보여주기
            // 각각의 페이지를 생성자 호출을 통해 지정
            // 이름을 미리 만들어 놓은 것을 route라고 함.
        '/page1': (context) => Page1(data: '시작'),
        '/page2': (context) => Page2(data: '1페이지에서 보냄(1->2)'),
        '/page3': (context) => Page3(data: '1페이지에서 보냄(1->3)'),
      },
    );
  }
}
