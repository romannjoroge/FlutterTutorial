// Dart comes with support for type inference using the var type keyword

// A program that uses one variable to store data of different types. This can
// be done using a dynamic variable

// var and dynamic both initially take a value of any type but with var the next
// value it takes cannot be of another type but with dynamic it can

// final can take any type but once the variable is initialized it can't accept
// another value

void main() {
  // A program to print the details of a person i.e name, age and weight
  // using one variable

  dynamic detail = "Roman Njoroge"; // Initially a string
  print("My name is");
  print(detail);

  detail = 18; // Then an int
  print("My age is");
  print(detail);

  detail = 72.5; // Then a float
  print("My weight in kilos is");
  print(detail);
}

// This is impossible when using var unless the variable is redifined since the first time the
// variable is used it is given a type
