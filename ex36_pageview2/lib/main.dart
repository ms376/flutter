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
      home: const MyHomePage(title: 'Ex36 PageView2'),
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
  final _pageController = PageController(
    initialPage: 0,
  );
  List<String> pages = ['Page1', 'Page 2', 'Page 3'];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Page 1', style: TextStyle(fontSize: 20)),
                  onPressed: () => onClick(0),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Text('Page 2', style: TextStyle(fontSize: 20)),
                  onPressed: () => onClick(1),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Text('Page 3', style: TextStyle(fontSize: 20)),
                  onPressed: () => onClick(2),
                ),
              ],
            ),
            Text(
              '터치한 후 좌우로 Swipe 하세요.',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return getPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClick(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget getPage(int index) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(index),
            Text(
              pages[index],
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(int index) {
    if (index == 0) {
      return const Icon(Icons.camera_alt, color: Colors.red, size: 35.0);
    } else if (index == 1) {
      return const Icon(Icons.add_circle, color: Colors.orange, size: 35.0);
    } else {
      return const Icon(Icons.star, color: Colors.indigo, size: 35.0);
    }
  }
}
