void main() {
  String? name; // Putting the ? allows the variable to be nullabe
  String isAlive;
  // The normal if-else statements

  // If name is null assing isAlive the value "RIP", else assign isAlive the
  // value of name
  if (name == null) {
    isAlive = "RIP";
  } else {
    isAlive = name;
  }

  // This can be shortened to be
  // expression ?? default-value where if the expression produces a null the
  // default value is returned otherwise the value of the expression is returned
  isAlive = name ?? "RIP";

  // Can also be
  // (condition) ? expressionA : expressionB if the condition is true the value
  // returned by expressionA is returned otherwise that of expressionB is
  // returned
  isAlive = (name == null) ? "RIP" : name;

  // switch-case
  var number = 5;
  switch (number) {
    case 1:
      print("1");
      break;
    default:
      print("NO!");
  }

  // for loop
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  List<int> test = [1, 2, 3, 4, 5, 8];
  for (var item in test) {
    print(item);
  }
}
