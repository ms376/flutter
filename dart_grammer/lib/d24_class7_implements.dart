abstract class Greet{
  greet();
}
abstract class Talk {
  talk();
}

class Morning extends Greet
{
  @override
  greet() {
    print("아침인사");
  }
}
class Evening implements Greet, Talk
{
  greet() {
    print("저녁인사");
  }
  talk() {
    print("대화");
  }
}
void main()
{
  Morning m = Morning();
  m.greet();

  Evening e = Evening();
  e.greet();
  e.talk();
}