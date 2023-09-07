class Unit {
  move() {print("이동1");}
  attack() {print("공격1");}
  heal() {print("치료1");}
}
class Marine extends Unit {
  move() {print("마린 이동");}
  attack() {
    super.attack();
    print("마린 공격");
  }
  // 이노테이션으로 부모함수 재정의 : 오버라이딩하는 메서드명이 맞는지 체크
  @override
  heal() {
    super.heal();
    print("마린 치료");
  }
}
void main(){
  var unit =Marine();
  unit.move();
  unit.attack();
  unit.heal();
}