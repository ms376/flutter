import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page3 extends StatefulWidget {
  String data = '';
  Page3({super.key, required this.data});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pop(context, '3페이지에서 보냄(Pop)');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('2페이지로 변경', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Page3(
                      data: '3페이지에서 보냄 (Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
