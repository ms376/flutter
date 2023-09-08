import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home: const MyHomePage(title: 'Ex25 ScrollView'),
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
        child: Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          width: 300,
          height: 500,
          color: Colors.cyan,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[700],
                    child: Text('Entry A', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[500],
                    child: Text('Entry b', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[300],
                    child: Text('Entry c', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[100],
                    child: Text('Entry d', style: TextStyle(fontSize: 30)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
