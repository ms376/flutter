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
      home: const MyHomePage(title: 'Ex21 Alert Dialog'),
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
  String _sPersonName = '';
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
              child: const Text('Show AlertDialog',
                  style: TextStyle(fontSize: 24)),
              onPressed: () => _showAlertDialog(context, 'hello~'),
            ),
          ],
        ),
      ),
    );
  }

  Future _showAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context,
      /*
        화면에 빈곳을 눌러도 창이 닫히지 않음
        true => 창이 닫힘
      */
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          // 배경색
          data: ThemeData(dialogBackgroundColor: Colors.orange),
          child: AlertDialog(
            // 모서리 부분을 라운딩 처리  
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: const Text('AlertDialog Example'),
            content: SizedBox(
              height: 90,
              child: Column(
                children: [
                  Text(message),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Name', hintText: '홍길동'),
                    onChanged: (value) {
                      _sPersonName = value;
                    },
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  print('OK - $_sPersonName');
                },
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                  print('Cancel');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
