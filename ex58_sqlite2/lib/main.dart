import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late Future<Database> database;

  @override
  void initState(){
    super.initState();
    database = getDB();
  }
  Future<Database> getDB() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'mytest.db');
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        var data = await rootBundle.load(join('assets/database','orginal.db'));
        List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes, 
          data.lengthInBytes,
          );
          await File(path).writeAsBytes(bytes,flush: true);
      }
    }
    return await openDatabase(path);
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
              child: const Text('Select', style: TextStyle(fontSize: 24)),
              onPressed: () => doSelectAll(),
            ),
          ],
        ),
      ),
    );
  }
  void doSelectAll() async{
    final Database db = await database;
     await db.execute('''
    CREATE TABLE IF NOT EXISTS family (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      relation TEXT
    )
  ''');
    List<Map> datas = await db.rawQuery('select * from family');
    if (datas.isNotEmpty) {
      for (int i = 0; i < datas.length; i++) {
        String name = datas[i]['name'];
        int age = datas[i]['age'];
        String relation = datas[i]['relation'];

        print('$name $age $relation');
      }
      } else{
        print('SelectAll : 데이터가 없습니다.');
      }
    }
  }
