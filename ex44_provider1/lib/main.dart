import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      기본형인 MaterialApp을 Provider로 감싸면, 앱 전체에서 사용할 수 있는
      공유데이터가 된다.
    */
    return Provider<String>.value(
      value: '홍길동',
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.purple,
        ),
        home: const Page1(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String data = '';

  @override
  Widget build(BuildContext context) {

    // 데이터 사용
    // listen: false - 번경에 대한 알림 받지 않기
    // data = Provider.of<String>(context, listen: false);

    // Provider를 통해 데이터를 얻어온다.
    data = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        child: Center(
            child: Container(
              color: Colors.yellow,
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
              Container(
                color: Colors.red,
                child: ElevatedButton(
                  child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page2()),
                    );
                  },
                ),
              ),
              Text('$data', style: const TextStyle(fontSize: 30)),
              // 문자열 표현식 만 있는 경우 문자열 보관을 사용하면안됨
                      ],
                    ),
            )),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
            ),
            Consumer<String>(builder: (context, value, child) {
              print("111111");
              return Text(value, style: const TextStyle(fontSize: 30));
            }),
          ],
        ),
      ),
    );
  }
}
