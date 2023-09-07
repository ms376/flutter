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
      home: const MyHomePage(title: 'Ex16 Toogle Button Deco'),
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
  // 토글버튼에서 사용할 리스트
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
            // 여러개 선택 가능한 토글
            const Text('multi-select', textScaleFactor: 2),
            ToggleButtons(
               children: const [ // -위젯생략 <Widget>
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected1[index] = !isSelected1[index];
                  print('isSelected1 : $isSelected1');
                });
              },
              // 각 버튼의 값으로 사용할 List 설정
              isSelected: isSelected1,
              // 각 버튼의 아이콘을 설정
            ),
            const SizedBox(height: 20),
            const Text('single select', textScaleFactor: 2),
            ToggleButtons(
              children: const [ // -위젯생략 <Widget>
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
              onPressed: (int index) {
                setState(() {
                  // 항목중 하나만 선택할 수 있도록 for문으로 처리
                  for (var i = 0; i < isSelected2.length; i++) {
                    if (i == index) {
                      isSelected2[i] = true;
                    } else {
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2 : $isSelected2');
                });
              },
              isSelected: isSelected2,
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
