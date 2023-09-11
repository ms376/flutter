import 'dart:io';

// async await는 pair : await은 async내부에서만 사용가능
Future<void> myRequest1() async
{
  print("myRequest1() 작업 시작");
  // 1초씩 딜레이 시켜준다. ( 총 10초)
  for(int i=0; i<10; i++){
    stdout.write('$i');
    // await는 함수에만 사용 가능 . 1초위라는 것
    await Future.delayed(Duration(seconds: 1));
  }
  print('\nmyRequest1()작업 끝');
}

// Future<int>객체를 반환하는 메서드
Future<int> myRequest2(num)
{
  // 결과가 미래에 생긴다. 기다리지 않음.
  var req = Future((){
    print("myRequest2() 작업 시작2");
    int rNum= 0;
    for(int i=0; i<num; i++){
      rNum+=1;
    }
    print('myRequest2()작업 끝');
    return rNum;
  });
  // 위의 결과가 생성되기전에 리턴되므로 잘못된사용. 시간차공격임
  return req;
  }

Future<int> myRequest3(num)
{
  var req = Future((){
    print("myRequest3(num) 작업 시작");
    int rNum= 0;
    for(int i=0; i<num; i++){
      rNum+=1;
    }
    print('myRequest3(num)작업 끝');
    return rNum;
  });
  return req;
}
void main() async{
  print('\nmain 시작01');
  myRequest1();
  print('\nmain 끝01');

  print('main 시작02');
  var val2= await myRequest2(10);
  var val3 = myRequest3(20);
  val3.then((value){
    print('then절에서 출력:$value');
  }, onError: (error){
    print(error);
  });
  print('val2 : $val2');
  print('val3 : $val3');
  print('main 끝02');
}
