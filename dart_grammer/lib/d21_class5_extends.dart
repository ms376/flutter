class Unit {
  var health=10;
}
class Marine extends Unit {
  var attack = 1;
}
void main (){
  var unit= Marine();
  print("체력:${unit.health}");
  print("공격력:${unit.attack}");
}