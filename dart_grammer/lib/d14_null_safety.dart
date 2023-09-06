void main()
{
  int num1= 5;    // null 값을 허용하지 않는 변수로 선언.
  int? num2 = 2;  // null 값을 허용하는 변수. 값이 없으면 null

  // num1= null;  // 에러발생 : Non-Nullable
  num2= null;     // ok : Nullable

  // String str1= null; // error: Non-Nullable
  String? str2 = null;  // ok : Nullable

  print("1 =========================================");

  // *** Null Safety 규칙 *** null 일떄 안전하게 사용하기 위해

  // Non-Nullable 변수는 값 대인 없이 사용할 때 error

  // int a1; print(a1);  // 에러발생
  int? a2; print (a2);

  var a3 =10;
  var a4 = null;
  var a5;

  print("2 =========================================");

  int? num3= 5;
  int? num4;

  num4=10;
  num3!=num4;
  // num3=num4;
  print(num4);

  String? name;
  // null이 아닐때 메서드 실행
  // ?를 제거하면 에러발생됨. 객체가 null인 상태에서는 맴버메서드를 호출할
  // 수 없기 때문이다.
  name= name?.toLowerCase();

  // null일때
  int val2 = int.tryParse('n42') ?? -1;
  print('val2 = $val2');

  String? name1;
  name1='ssss';
    // name1='ssss'; 이 값이 없으면 런타임 에러가 난다.

    // String text = name1;

    /*
    ? (널 지정 연산자 - Null-awareness operator):

    ?는 변수 또는 표현식 앞에 사용되며, 해당 변수 또는 표현식이 널(null)일 수 있음을 나타냅니다.
    예를 들어, int? x는 정수 변수 x가 널이 될 수 있다는 것을 의미하며, x에 대한 접근 시 널 체크가 필요합니다.
    ! (널 언더스코어 연산자 - Null assertion operator):

    !는 변수 또는 표현식 뒤에 사용되며, 해당 변수 또는 표현식이 절대로 널(null)이 아니라고 단언합니다.
    예를 들어, String name = user!.name은 user가 널이 아니라고 단언하고 name에 접근합니다.
    만약 user가 널이면, 런타임에서 NoSuchMethodError가 발생합니다.
    */
    String text= name1!;
    print(text);
}