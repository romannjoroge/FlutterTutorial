mixin Results {
  void pass() => print("You have passed!");
  void fail() => print("You have failed!");
}

class Test with Results {
  // Fields
  final int a;
  final int b;

  Test({int x = 0, int y = 0})
      : a = x,
        b = y {
    print("Created test class!");
  }

  int call(int x, int y) => x + y;

  Test copyWith({int? x, int? y}) => Test(x: a ?? this.a, y: b ?? this.b);
}

class Test2 extends Test {
  final int c;
  @override
  int call(int x, int y) => super.call(x, y) * 2;
  Test2({int x = 0, int y = 0, int z = 0})
      : c = z,
        super(x: x, y: y) {
    print("Test 2 created!");
  }
}

extension TestString on String {
  void test_null() {
    if (this.isEmpty) {
      print("Fail");
    } else {
      print("Pass");
    }
  }
}

class Fraction {
  final num numerator;
  final num denominator;

  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw FractionDivisionByZero("Cannot divide by zero");
    }
    if (numerator == 0) {
      throw UnsupportedError("Fraction is just zero");
    }
  }
}

class FractionDivisionByZero implements Exception {
  final String message;

  FractionDivisionByZero(this.message);

  @override
  String toString() => message;
}

void main() {
  var number = Test(x: 1, y: 2);
  var add = number(2, 3);
  print(add);
  var test2 = number.copyWith();
  print(test2.a);
  test2.pass();
  number.fail();
  String to_be_tested = "Hello";
  String to_be_tested2 = "";
  to_be_tested.test_null();
  to_be_tested2.test_null();
  try {
    var frac = Fraction(1, 0);
  } on FractionDivisionByZero catch (exc) {
    print(exc);
  }

  try {
    var frac2 = Fraction(0, 1);
  } on UnsupportedError catch (exc) {
    print(exc);
  } finally {
    print("Executed");
  }
}
