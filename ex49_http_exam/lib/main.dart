import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home: const MyHomePage(title: 'Ex50 Http Exam'),
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
              child: const Text('Http (Get)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _getRequest();
              },
            ),
            ElevatedButton(
              child: const Text('Http (Post)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _postRequest();
              },
            ),
          ],
        ),
      ),
    );
  }
  void _getRequest() async{
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/1694662873413");
    http.Response response = await http.get(
      url,headers:{"Accept" : "application/json"}
    );
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    print("statusCode: $statusCode");
    print("responseBody : $responseBody");
  }
  void _postRequest() async{
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts");
    http.Response response = await http.post(
      url,headers:{"Content-Type" : "application/x-www-form-urlencoded",},
      body: {"name":"오일남",
      "tel":"010-5151-5151",
      "address":"오징어 게임장"
      },
    );
    
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
  }
}
