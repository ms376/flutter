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

  if(unit1 is Marine){
    print('마린입니다.');
    print(unit1.name);
  }else{
    print('마린이 아님');
  }
  if(unit2 is Medic){
    print('메딕입니다.');
  }else{
    print('메딕이 아닙니다.');
  }
}

