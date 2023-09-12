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
      home: const MyHomePage(title: 'Ex33 GridView2'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              child: GridView.count(
                // 스크롤은 새로반향이 디폴트
                // scroolDirection: Axis.verical,
                crossAxisCount: 3,  //타일갯수가 자동계산
                childAspectRatio: 1.5,  // 가로세로 비율 정함.
                // int(50)의 길이만큼 0부터 index-1까지 범위의 각 인덱스를
                // 오름차순으로 호출하여 만든 값으로 리스트를 생성한다.
                children: List.generate(50, (index) {
                  return const Card(
                    color: Colors.blue,
                    child: Icon(
                      Icons.face,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.horizontal,   // 가로스크를 방향으로 설정
                children: List.generate(50, (index) {
                  return const Card(
                    color: Colors.amber,
                    child: Icon(
                      Icons.face,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
