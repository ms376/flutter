import 'd20_class4_get_set2.dart';

void main(){
   var unit1 = Unit();
   unit1.age = 30;
   print(unit1.age);


   // 계단식 표기법 ..연산자를 통해 연속해서 메서드 호출하기.
   var unit2=Unit()
   ..setName('메딕')
   ..setAge(150);
   print("이름:${unit2.name}, 나이:${unit2.age}");

   // 일반적인 메서드 호출방식
   unit2.setName('커맨드센터');
   unit2.setAge(222);
   print("이름: ${unit2.name},나이:${unit2.age}");
}