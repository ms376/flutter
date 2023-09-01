import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 93, 183, 58)),
        // useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Ex02 start 02'),
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          title: const Text('Example Title'),
          // const 로 상수 정의하면 화면을 더이상 그리지 않음. const가 붙으면 상태가 없는 애
          // 즉 정보가 변하지 않는 애를 말한다. 속도가 빨라진다. 나중에 바꾸려면 const붙이지 않음,
          //    자동 완성에서 알려주는 방법이 최선은 아님. 모바일은 초당 60프레임이 나옴.
          //    화면이 60번 깜빡일때 까지 화면이 변하지 않으면 밧데리가 절약이 됨.
        ),
        body: const Center(
          child: Text('Example Body',
          style: TextStyle(fontSize: 30),
          ),
        )
      )
    );
  }
}