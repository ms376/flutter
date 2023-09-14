import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const MyHomePage(title: 'Ex47 SharedPreferences '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// 스마트폰에서 앱을 완전 종료 후 다시 실행 해야 함.
class _MyHomePageState extends State<MyHomePage> {
  late int counter;
  late SharedPreferences prefs;

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      // 기존에 저장된 값이 없다면 0, 있으면 해당값으로 변수값을 설정
      counter = (prefs.getInt("counter") ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    // 아래 메서드로 객체 생성
    getSharedPreferences();
  }


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
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                heroTag: "빼기",
                child: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                  // 숫자 감소 후 객체에 값을 저장.
                  prefs.setInt("counter", counter);
                },
              ),
            ),
            const Text("Shared preferences value: "),
            Text(
              "$counter",
              style: const TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                heroTag: "더하기",
                child: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  prefs.setInt("counter", counter);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
