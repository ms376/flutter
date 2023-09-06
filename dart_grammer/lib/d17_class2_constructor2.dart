class Unit
{
  int? health;    // 초기화가 안될 수 도 있다는 뜻
  int? move;

  Unit.init() : health = 10, move = 1{
  }
  // 생성자 선언. 옵션( 들어올 수 있고, 안들어올 수 있음(null일수도 있음))
  Unit({int? health}):move = 2{
    this.health=health ?? 0;
  }
}
void main () {
  Unit unit1= Unit.init();
  print('unit1.health : ${unit1.health}');
  print('unit1.move : ${unit1.move}');
  print("=========================");

  Marine unit2 = Marine();  //인자가 null이므로 0이나옴
  // Marine unit2= Marine(health: 20);
  print('unit2.health : ${unit2.health}');
  print('unit2.move : ${unit2.move}');
  print('unit2.attack : ${unit2.attack}');
}
class Marine extends Unit
{
  late int attack;    // 자식에서 추가한 멤버 변수
  // 초기화 리스트를 통해 1로 초기화하고 , 나머지는 부모 생성자를 호출한다.
  Marine({int? health}) : attack = 1, super(health: health){}
}