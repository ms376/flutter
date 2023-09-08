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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.red,
        highlightColor: Colors.black.withOpacity(.5),
      ),
      home: const MyHomePage(title: 'Ex26 ListView1 Deco'),
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
  var _checkboxValue = false;
  var _radioVlaue = 0;
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: getMyList(),
      ),
    );
  }

  List<Widget> getMyList() {
    List<Widget> myList = [
      Container(
        height: 100,
        alignment: Alignment.center,
        color: Colors.amber[600],
        child: const Text('onTab이 없어 클릭 안됨', style: TextStyle(fontSize: 30)),
      ),
      ListTile(
        title: const Text('Basic #1'),
        subtitle: const Text('타이틆과 서브 타이틀로만 구성'),
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          print('Basic #1');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #2'),
        trailing: const Icon(Icons.autorenew),
        onTap: () {
          print('Basic #2');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text('Basic #3'),
        subtitle: const Text('기본형의 모든 요소 사용'),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Basic #3 - isThreeLine: false'),
        subtitle: const Text('내용이 길면 다음 줄로 내용이 넘어간다. 그러나 공간이 확장된다.'),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine: false');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Basic #3 - isThreeLine: true'),
        subtitle: const Text('내용이 길면 다음 줄로 내용이 넘어간다. 공간도 같이 한줄 늘어난다.'),
        isThreeLine: true,
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine: true');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      CheckboxListTile(
        value: _checkboxValue,
        title: const Text('CheckBox ListTile'),
        secondary: _checkboxValue
            ? const Icon(Icons.thumb_up)
            : const Icon(Icons.thumb_down),
        onChanged: (bool? value) {
          setState(() {
            _checkboxValue = value!;
          });
          print('CheckBox ListTitle');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      RadioListTile(
        title: Text('GOOD'),
        groupValue: _radioVlaue,
        value: 1,
        selected: true,
        onChanged: (int? value) {
          setState(() {
            _radioVlaue = value!;
          });
        },
      ),
      RadioListTile(
        title: Text('NOT GOOD'),
        groupValue: _radioVlaue,
        value: 2,
        onChanged: (int? value) {
          setState(() {
            _radioVlaue = value!;
          });
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      SwitchListTile(
        title: Text('Switch ListTitle'),
        subtitle: Text(_switchValue ? 'on' : 'off'),
        value: _switchValue,
        onChanged: (bool value) {
          setState(() {
            _switchValue = value;
          });
          print('Switch ListTitle');
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: ListTile(
          leading: const Icon(
            Icons.account_box,
            size: 50.0,
          ),
          title: const Text(
            'Card -> ListTitle',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          subtitle: const Text('클릭시 리플 효과 표시 됨'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('fff');
          },
        ),
      ),
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          onTap: () {
            print('ggg');
          },
          child: const Row(
            children: [
              SizedBox(
                width: 100,
                height: 150,
                child: Icon(
                  Icons.account_box,
                  size: 50.0,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "location",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Population: 08 / 09 / 2023',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.data_usage),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    return myList;
  }
}
