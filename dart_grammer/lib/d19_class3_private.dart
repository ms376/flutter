import 'd19_class3_private2.dart';

class Unit
{
  late String _name;
  late int age;

  // 생성자 간단하게 사용하기
  // 어차피 연결할 것 ... 파라미터 부분에서
  Unit (this._name,this.age);
}
void main()
{
  // Unit클래스는 같은 라이브러리 이므로 private 멤버도 접근 가능하다.
  var unit1=Unit("마린",25);
  print(unit1._name); // private이지만 에러없이 출력됨(Java에서는 에러)
  print(unit1.age);

  // Unit2클래스의 경우 외부에서 정의되었으므로 private멤버는 접근할 수 없다.
  var unit2 = Unit2("메딕",20);
}