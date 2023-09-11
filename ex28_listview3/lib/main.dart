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
      home: const MyHomePage(title: 'Ex28 ListView3'),
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
  late List<Person> persons;

  void initState(){
    super.initState();

    persons=[];
    for (var i = 0; i < 15; i++) {
      persons.add(Person(i+21,'홍길동전$i',true));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: 
      Container(
        margin: EdgeInsets.all(5),
        color: Colors.yellow,
        child: Container(
          margin: EdgeInsets.all(1),
          child: ListView.separated(
            itemCount: persons.length,
            itemBuilder: (BuildContext context, int index) {
              return PersonTile(persons[index],index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider( // 구분선
                color: Colors.black,
                height: 1,    // 구분선은 해당 속성에 따라 다른결과를 출력한다.
                thickness: 1.0,
              );
            }, 
            ),
        ),
      ),
      );
  }
}
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}

class PersonTile extends StatelessWidget{
  final Person _person;
  final int index;    // 타일의 추가데이터가 필요한 경우 생성자추가
  PersonTile(this._person,this.index);

  @override
  Widget build(BuildContext){
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age}세"),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){
        print('추가 데이터 : $index');
      },
    );
  }
}
