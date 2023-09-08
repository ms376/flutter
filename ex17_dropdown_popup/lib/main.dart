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
      home: const MyHomePage(title: 'Ex17 DropDown Popup'),
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
  // 드롭다운 버튼에서 선택한 항목을 출력하기 위한 전역변수(함수 외부에서 선언)
  String _chosenValue = 'Flutter';
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
            DropdownButton<String>(
              style: const TextStyle(color: Colors.red),
              value: _chosenValue,
              items: [
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map((value) {
                // 드롭다운에서 선택한 항목을 반환한다
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // 드롭다운의 가로크기를 텍스트만큼 지정한다.
              hint: const Text(
                "힌트글인데 이걸로 크기조정을...",
              ),
              // 특정항목을 선택시 실행할 메서드를 지정함(Null Safety체크가 필요함)
              onChanged: (String? value) {
                // 외부에서 선언된 메서드 호출
                popupButtonSelected(value!);
                // 변수의 값이 변환할 때 렌터링을 다시 한다.
                setState(() {
                  // 이 부분이 주석처리되면 화면은 변하지 않는다.
                  _chosenValue = value;
                });
              },
            ),
            // 위젯간의 간격을 조금 띄움
            const SizedBox(
              height: 50,
            ),
            // 드롭다운 버튼과 기능은 동일하나 UI가 조금 다른 위젯이다.
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "팝업메뉴Value",
                  child: Text("팝업메뉴Text"),
                ),
                const PopupMenuItem(
                  value: "Value 1",
                  child: Text("child 1"),
                ),
                const PopupMenuItem(
                  value: "Value 2e",
                  child: Text("child 2"),
                ),
              ],
              // 특정항목 선택시 메서드 호출
              onSelected: popupMenuSelected,
            )
          ],
        ),
      ),
    );
  }
  // 외부정의 메서드
  void popupButtonSelected(String value) {
    print(value);
  }

  void popupMenuSelected(String value) {
    print(value);
  }
}
