// class Point {
//   int? x;
//   int? y;
// }
//
// class PointDetail extends Point {
//   int? z;
// }
//
// void main() {
//   PointDetail p1 = PointDetail();
//   p1.x = 4; // Use the setter method for x.
//   p1.y = 5;
//   p1.z = 6;
//
//   // 자식클래스(PointDetail)를 부모클래스(Point)로 타입 캐스팅 하는것을
//   // 업캐스팅(up-casting)이라 합니다.
//   //부모타입으로 캐스팅해서 막 사용하다가 자식객체를 다시 받아야 할때
//
//   Point p2 = p1;
//
//   //다시 point detail의 z값에 접근하거나 사용해야할때.
//   if (p2 is PointDetail) {  // (is로 판단해서 한번 확인했기 때문에 as 생략가능)
//     PointDetail p3 = p2 as PointDetail; //다운 캐스팅
//     print(p3.z);
//     print("ㅇㅇ");
//   } else {
//     print("ㄴㄴ");
//   }
// }





class Unit {
  var health=10;
}
class Marine extends Unit{
  var name = '마린';
}
class Medic extends Unit{
  var name = '메딕';
}
void main()
{
  Marine marine = Marine();
  Medic medic = Medic();

  Unit unit1 = marine as Unit;
  Unit unit2 = medic;

  // is는 특정타입이 맞다면 즉 상속관계가 있으면 true를 반환한다.
  if(unit1 is Marine){
    print('마린입니다.');
    print(unit1.name);
  }else{
    print('마린이 아님');
  }
  /*
    자바에서는 부모타입의 참조변수로 자식쪽 멤버변수에 접근불가함.
    하지만 Dart에선 가능, 변수까지 오버라이딩되는 느낌이라 생각하면 됨.
  */
  // print(unit1.name); //=> 단독적으로 해당문장을 사용할 수 없다.
  /*
    이 문장을 of문 블럭 외부로 옮기면 에러가발생.
    is를 통해 부모타입을 자식타입으로 변환이 가능한지 확인 후 접근허용 가능해진다.
  */
  if(unit2 is Medic){
    print('메딕입니다.');
  }else{
    print('메딕이 아닙니다.');
  }
}

