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
      home: const MyHomePage(title: 'Ex24 TimePicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TimeOfDay _selectedTime = TimeOfDay.now();

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
            Text(
              '${_selectedTime.hour}:${_selectedTime.minute}',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child:
                  const Text('Show DatePicker', style: TextStyle(fontSize: 24)),
              onPressed: () => selectTime(),
            ),
          ],
        ),
      ),
    );
  }

  Future selectTime() async {
    // showTimePicker 객체가 반환한 값을 통해 선택한 시간 설정
    TimeOfDay? picked = await showTimePicker(
      /*
        context값이 필요하면, future타입으로 TimeOfDay 타입의 값을
      */
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.pink,
              onSurface: Colors.pink,
            ),
          ),
          child: child!,
        );
      },    // 여기서 사용자가 시간을 선택할 떄 까지 코드가 블록됨.
    );
    // 타입피커를 통해 선택한 시간으로 설정한다.
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
