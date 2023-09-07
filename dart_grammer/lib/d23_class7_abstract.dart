// 추상클래스 또는 인터페이스로도 사용가능
abstract class Unit{
  move(); // 동작을 구현하지 않고 ";"으로 마무리하여 추상 메서드
          // 다 만들지 않았음. => 오버라이딩이 필수
}
class Marine extends Unit{
  // 기능의 완성
  move(){print("마린 이동");}
}

// extends나 implement나 동일
class Medic implements Unit{
  // 기능의 완성
  move() { print("메딕 이동");}
}

void main(){
  var unit1=Marine();
  unit1.move();

  var unit2=Medic();
  unit2.move();

  // 추상클래스는 상속을 목적으로 생성한다. 객체를 생성할 수 없다.
  // var unit3=fire();  <=안됨
}