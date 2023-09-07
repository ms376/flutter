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
      home: const MyHomePage(title: 'Ex13 Textfield2'),
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
          children: [
            const Text(
              '50자 이내로 입력하세요',
              style: TextStyle(fontSize: 30.0),
            ),
            /*
              텍스트 필드를 멀티라인으로 사용하는 경우 화면사이즈를 넘어가면
              제대로 표현되지 않으므로 이때는 Expanded위젯으로 감싸준다. 이때
              Ctrl + "." 을 사용하면 된다.
            */
            Expanded(
              child: TextField(
                maxLength: 50,
                maxLines: 30,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                      width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,width: 1.0),
                  ),
                  counterStyle: TextStyle(
                    fontSize: 20.0, color: Colors.red,
                  ),
                ),
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (text){
                  print('Submitted : $text');
                },
              ),
            ),
            ElevatedButton(
              child: const Text('키보드내리기',style: TextStyle(fontSize: 24,color: Colors.black54)),
              onPressed: () => _onClick(),
            ),
          ],
        ),
      ),
    );
  }
  void _onClick() {
    FocusScope.of(context).unfocus();
  }
}
