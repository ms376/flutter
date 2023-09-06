class Unit
{
  late String name;
  late int age;
  Unit() {
    this.name = "홍길동";
    this.age = 10;
  }
  Unit.init1(name){
    this.name=name;
    this.age=10;
  }
  Unit.init2(name, age){
    this.name=name;
    this.age=age;
  }
}
void main(){
  Unit myUnit1= Unit();
  Unit myUnit2= Unit.init1("마린");
  Unit myUnit3= Unit.init2("마린",30);
}