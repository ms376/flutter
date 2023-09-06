class Unit
{
  // ?로 null 가능 으로 처리할 수 도 있지만
  // 나중에 초기화 된다는 것을 명시해 줌
  late String name;
  late int age;
  // Unit() {} // 디폴트 생성자
  Unit(String name, int age)
  {
    this.name=name;
    this.age=age;
  }
}
void main()
{
  // 디폴트 생성자가 없어서 에러 발생
  // var unit1 = new Unit();

  // 자바와 같은 방식 - Dart 에서는 권장 하지 않음
  var unit2=new Unit("마린",20);

  // 보통은 new가 옵션이라 생략
  var unit3= Unit("메딕",25);

  // late로 선언하는 경우 객체생성시 반드시 null이 아닌 값으로 초기화해야한다.
  // var unit4 = Unit("파이어뱃",null);

  print('unit2=${unit2.name},${unit2.age}');
  print('unit3=${unit3.name},${unit3.age}');

}