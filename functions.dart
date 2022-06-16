// Functions are objects of type function meaning you can store them in
// variables

// Function to return if a number is even
bool isEven(int a) => (a % 2) == 0;

// Function that takes another function that returns a boolean and has 1 int as
// an arguement as its arguement
void test(bool Function(int a) action) {
  final List<int> items = [1, 2, 3, 4, 5, 6];

  for (var item in items) {
    print(action(item));
  }
}

// A function with named optional parameters with default values
int required_param(int a, {int b = 0, int c = 0}) {
  print(a);
  return a + b + c;
}

// Function with ordered positional params so you don't have to right param name
// when executing function
void required_param2(int a, [int b = 0, int c = 0, int? d]) {
  print(a);
}

void main() {
  bool Function(int) checker = isEven;

  print(checker(7));

  // Anonymous functions
  bool Function(int) checker2 = (int a) => !(a % 2 == 0);
  print(checker2(7));

  test((int a) => !(a % 2 == 0));
}
