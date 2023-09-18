import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

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
      home: const MyHomePage(title: 'Ex63'),
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
  String name = '';
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '1:130383516369:android:fc21d8b4688fab68072bf0',
        apiKey: 'AIzaSyDlJ0Cjy7QwR6tRf9y6hkjbkNFwVg2ZOvw',
        projectId: 'flutter-exam-fd375',
        messagingSenderId: '130383516369',
      );

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

  Future<void> InitializeSecodary() async {
    name = 'myFcm';
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initalized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions? options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    print('App $name deleted');
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
            ElevatedButton(
              child: const Text('Initialize default app'),
              onPressed: initializeDefault,
            ),
            ElevatedButton(
              child: const Text('Initialize secondary app'),
              onPressed: InitializeSecodary,
            ),
            ElevatedButton(
              child: const Text('Get apps'),
              onPressed: apps,
            ),
            ElevatedButton(
              child: const Text('List options'),
              onPressed: options,
            ),
          ],
        ),
      ),
    );
  }
}
