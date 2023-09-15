import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Ex57 SQL Lite #1'),
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
  int seqNum = 0;
  final ctlMyText1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  void createDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'telbook.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE telbook( " +
              "  id INTEGER PRIMARY KEY, name TEXT, telnum TEXT)",
        );
      },
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => doInsert(),
                child: const Text('Insert', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => doSelectAll(),
                child: const Text('Select All', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 240,
                child: TextField(
                  controller: ctlMyText1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doSelectOne(nNum);
                },
                child: const Text('Select One', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doUpdate(nNum);
                },
                child: const Text('Update', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doDelete(nNum);
                },
                child: const Text('Delte', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => doDeleteAll(),
                child: const Text('Delte All', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doSelectAll() async {
    final Database db = await database;
    List<Map> datas = await db.rawQuery('select * from telbook');
    if (datas.length > 0) {
      for (int i = 0; i < datas.length; i++) {
        int id = datas[i]['id'];
        String name = datas[i]['name'];
        String telnum = datas[i]['telnum'];
        print('$id $name $telnum');
      }
    } else {
      print('SelectAll : 데이터가 없습니다.');
    }
  }

  void doSelectOne(int num) async {

    final Database db = await database;

    List<Map> data = await db.rawQuery('select * from telbook where id = $num');
    if (data.length > 0) {
      int id = data[0]['id'];
      String name = data[0]['name'];
      String telnum = data[0]['telnum'];
      print('$id $name $telnum');
    } else {
      print('SelectOne : 데이터가 없습니다.');
    }
  }

  Future<void> doInsert() async {
    final Database db = await database;
    seqNum = seqNum + 1;
    var telnum = '010-1234-$seqNum$seqNum$seqNum$seqNum';
    int count = await db.rawInsert(
        'insert into telbook(id,name,telnum) values(?,?,?)',
        [seqNum, '홍길동$seqNum', telnum]);
    print('Insert : $count');
  }

  Future<void> doUpdate(int id) async {
    final db = await database;

    int count = await db.rawUpdate(
        'update telbook set name = ?, telnum = ? where id = ?',
        ['손오공', '010-1234-xxxx', id]);
    print('Update : $count');
  }

  Future<void> doDelete(int id) async {
    final db = await database;

    int count = await db.rawUpdate('delete from telbook where id = ?', [id]);
    print('Delete : $count');
  }

  Future<void> doDeleteAll() async {
    final db = await database;

    int count = await db.rawUpdate('delete from telbook');
    print('DeleteAll : $count');
    seqNum = 0;
  }
}
