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
      home: const MyHomePage(title: 'Ex15 Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _myGroup1 = Fruit.apple;    // 첫번째 그룹 부분에 사용할 변수
  Fruit _myGroup2 = Fruit.banana;   // 두번째 그룹 부분에 사용할 변수

  bool _btn = true;

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
            // 라디오 버튼을 정확히 클릭해야 선택됨.
            ListTile(
              title: const Text('사과'),
              leading: Radio<Fruit>(
                groupValue: _myGroup1,
                value: Fruit.apple,
                /*
                  Flutter 2.0에서 적용되면서 Null Safety가 적용되어
                  Null Check부분이 강하되었음.
                */
                onChanged: (Fruit? value) {
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('바나나'),
              leading: Radio<Fruit>(
                groupValue: _myGroup1,
                value: Fruit.banana,
                onChanged: (value) {
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            const SizedBox(height: 50),
            RadioListTile(
              title: const Text('사과'),
              groupValue: _myGroup2,
              value: Fruit.apple,
              onChanged: (value) {
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  _btn = true;
                });
              },
            ),
            RadioListTile(
              title: const Text('바나나'),
              groupValue: _myGroup2,
              value: Fruit.banana,
              activeColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  _btn = false;
                });
              },
            ),
            const SizedBox(height: 50),   // 간단한 간격 조정
            ElevatedButton(
              // 버튼이 활성화 되었을때만 _onClick1메서드를 호출할 수 있다.
              // 버튼의 onPressed 매개변수를 null로 설정하면 버튼을 비활성화 할 수 있다.
              
              child: const Text('ElevatedButton',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: _btn ? _onClick1 : null,
            ),
          ],
        ),
      ),
    );
  }

  void _onClick1() {
    print('Radio 2 : $_myGroup2');
  }
}
