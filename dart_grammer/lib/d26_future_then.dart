// 메서드의 반환타입 형태로 future객체를 사용
Future<int> myRequest1(num){    // 미래에 <int> 반환한다.
  return Future(() {
    int rNum=0;
    // 전달된 인수만큼 반복하므로 시간이 걸리는 작업이라 가정한다.
    for (int i=0; i<=num; i++){
      rNum=rNum+i;
    }
    return rNum;
  });
}
// 비동기를 사용하는 경우, 결과가 오기전에 화면이 구현하는 것
void main(){
  print('main시작 1-1');
  // 메서드 호출후 Future<int>객체를 반환한다.
  var myReq1=myRequest1(1000);  // 결과를 기다리지 않고 다음 진행
  myReq1.then((data) {
    // 결과가 도착하면 나중에 출력한다.
    print('main작업 1-1 : $data');
  }, onError: (e) {
    print(e);
  });
  print('main끝1-1');
  print("==============================");

  print('main시작 1-2');
  myRequest1(100).then((data){
    print('main작업1-2 : $data');
  },
    onError: (e){
    print(e);
    });
  print("main끝1-2");
  print("==============================");
  int nCount = 10;
  Future<int> myRequest2 = new Future((){
    int rNum = 0;
    for(int i=0; i<nCount; i++){
      rNum=rNum+i;
    }
    return rNum;
  });
  print("myRequest2 시작3");
  myRequest2.then((data){
    print("myRequest2 작업3 : $data");
  },onError: (e){
    print(e);
  });
  print("myRequest2 끝3");
  /*
    위에서 호출된 3메서드는 시간이 걸리는 작업으로, main이 종료되더라도,
    실행도중 결과값 콜백시에 종료된다.
    Java의 Thread(스레드)와 유사한 동작방식을 가진다.
  */
}
