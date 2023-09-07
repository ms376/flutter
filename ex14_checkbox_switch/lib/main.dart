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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex14 Checkbox Switch'),
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
  bool _chk1 = false;
  bool? _chk2 = false;
  bool _chk3 = false;

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
          children: [
            Checkbox(
              value: _chk1, // 체크박스에서 사용할 값 지정
              // 체크 or 언체크시 이벤트 처리
              // 위에서 bool을 ? 안했기 때문에 이곳에서는 bool? 씀
              onChanged: (bool? value){  // 이벤트 체크
                setState(() {
                  _chk1 = value!;
                });
                print('Checkbox1 : $_chk1');
              }),
              Checkbox(
              value: _chk2,
              checkColor: Colors.pink,
              activeColor: Colors.green,
              onChanged: (value){
                setState(() {
                  _chk2 = value!;
                });
                print('Checkbox2 : $_chk2');
              }),
              Switch(
                value: _chk3,
                activeColor: Colors.red,    // 스위치가 켜졌을때 색
                activeTrackColor: Colors.cyan,  // 체크 배경색
                inactiveThumbColor: Colors.lightGreen,  // 스위치 꺼질때 색
                inactiveTrackColor: Colors.lightGreenAccent,  // 체크안됬을때 배경색
                // 스위치가 null값이 안나오므로 bool? 처리 안하면 ! 실행시에도 안함.
                onChanged: (value) {
                  setState(() {
                    _chk3=value;
                  });
                  print('Switch : $_chk3');
                }),
          ],
        ),
      ),
    );
  }
}
