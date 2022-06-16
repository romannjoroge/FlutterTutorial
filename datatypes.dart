// The present datatypes in dart are:
// int and double which are both subclasses of num (can store hexadecimal values
// and exponential representations of numbers)

void main() {
  String number = "121";
  var x = 100;

  // Convert a string to a number
  var converted_number = int.tryParse(number);

  // Convert a number to a string
  var converted_to_string = x.toString();

  print(converted_number);
  print(converted_to_string);

  // You can convert the result of an expression into a string using the
  // ${expr} syntax
  var age = 10 * 2;
  print("I am ${age} years old");

  print("The mafia does ${10 * 20 * 30} rounds a day");

  // enum is used to create a list of values that are constant. This removes the
  // need for checks when righting code that only uses enum values

  // Dart doesn't have array only has a template list class
  List<int> int_list = List<int>.filled(50, 0, growable: true);
  for (var i in int_list) {
    print(i);
  }
}
