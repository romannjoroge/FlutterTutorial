// Dart comes with support for type inference using the var type keyword

// A program that uses one variable to store data of different types. This can
// be done using a dynamic variable

void main() {
  // A program to print the details of a person i.e name, age and weight
  // using one variable

  dynamic detail = "Roman Njoroge";
  print("My name is");
  print(detail);

  detail = 18;
  print("My age is");
  print(detail);

  detail = 72.5;
  print("My weight in kilos is");
  print(detail);
}

// This is impossible when using var unless the variable is redifined since the first time the
// variable is used it is given a type
