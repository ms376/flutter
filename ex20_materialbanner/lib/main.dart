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
      home: const MyHomePage(title: 'Ex20 MaterialBanner'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Banner',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                // SnackBar 와 다른점: duration 옵션이 없다.
                // 스냅가는 화면위에 플로팅되지만, 머터리얼배너는 출력시
                // 다른배너를 밀어낸다.
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text('안녕하세요, 오른쪽 닫기를 누르세요.'),
                    leading: const Icon(Icons.info),
                    backgroundColor: Colors.yellow,
                    actions: [
                      TextButton(
                        child: const Text('닫기'),
                        onPressed: () => ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
