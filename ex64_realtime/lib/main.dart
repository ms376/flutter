import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';

late FirebaseApp fbApp;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  fbApp=await Firebase.initializeApp();
  print('Initalized default app $fbApp');
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
      home: const MyHomePage(title: 'Ex64'),
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
  int _counter = 0;

  late DatabaseReference _counterRef;
  late DatabaseReference _messagesRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  late StreamSubscription<DatabaseEvent> _messagesSubscription;
  bool _anchorToBottom = false;

  final String _kTestKey = 'Hello';
  final String _kTestValue = 'world!';
  FirebaseException? _error;

  @override
  void initState() {
    super.initState();

    _counterRef = FirebaseDatabase.instance.ref('counter');
    _messagesRef = FirebaseDatabase.instance.ref('messages');

    _counterSubscription = _counterRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _error = null;
        _counter = (event.snapshot.value ?? 0) as int;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        _error = error;
      });
    });

    _messagesSubscription =
        _messagesRef.limitToLast(10).onChildAdded.listen((DatabaseEvent event) {
      print('Child added: ${event.snapshot.value}');
    }, onError: (Object o) {
      final error = o as FirebaseException;
      print('Error: ${error.code} ${error.message}');
    });
  }

  void dispose() {
    super.dispose();
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  Future<void> _increment() async {
    await _counterRef.set(ServerValue.increment(1));
    await _messagesRef
        .push()
        .set(<String, String>{_kTestKey: '$_kTestValue $_counter'});
  }

  Future<void> _incrementAsTransaction() async {
    try {
      final TransactionResult = await _counterRef.runTransaction((mutableData) {
        return Transaction.success((mutableData as int? ?? 0) + 1);
      });
      if (TransactionResult.committed) {
        final newMessageRef = _messagesRef.push();
        await newMessageRef.set(<String, String>{
          _kTestKey: '$_kTestValue ${TransactionResult.snapshot.value}'
        });
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<void> _deleteMessage(DataSnapshot snapshot) async {
    final messageRef = _messagesRef.child(snapshot.key!);
    await messageRef.remove();
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
            Flexible(
              child: Center(
                child: _error == null
                    ? Text(
                        'Button tapped $_counter time ${_counter == 1 ? '' : 's'}.\n\n'
                        'This includes all devices, ever.',
                      )
                    : Text(
                        'Error retrieving button tap count:\n${_error!.message}',
                      ),
              ),
            ),
            ElevatedButton(
              child: const Text('Increment as transaction'),
              onPressed: () async {
                await _incrementAsTransaction();
              },
            ),
            ListTile(
              title: const Text('Anchor to bottom'),
              leading: Checkbox(
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      _anchorToBottom = value;
                    });
                  }
                },
                value: _anchorToBottom,
              ),
            ),
            Flexible(
              child: FirebaseAnimatedList(
                key: ValueKey<bool>(_anchorToBottom),
                query: _messagesRef,
                reverse: _anchorToBottom,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () => _deleteMessage(snapshot),
                        icon: const Icon(Icons.delete),
                      ),
                      title: Text(
                        '$index: ${snapshot.value.toString()}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
