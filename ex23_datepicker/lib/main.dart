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
      home: const MyHomePage(title: 'Ex23 DatePicker'),
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
  String _selecedDate = DateTime.now().toString();

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
            // 현재 날짜 혹은 선택한 날짜
            Text(_selecedDate, style: const TextStyle(fontSize: 30)),
            ElevatedButton(
              child:
                  const Text('Show DatePicker', style: TextStyle(fontSize: 24)),
              onPressed: () => selectDate(),
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectNowDate() {
    DateTime now = DateTime.now();
    if (now.weekday == 6) {
      now = now.add(const Duration(days: 2));
    } else if (now.weekday == 7) {
      now = now.add(const Duration(days: 1));
    }
    return now;
  }

  bool _predicate(DateTime day) {
    List days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    if (!days.contains(day.day.toInt())) {
      return true;
    }
    return false;
  }

  Future selectDate() async {
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectNowDate(),
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 2),
      selectableDayPredicate: _predicate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(primarySwatch: Colors.pink),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selecedDate = picked.toString().substring(0, 10);
      });
    }
  }
}
