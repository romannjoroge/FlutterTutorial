// A function that will take a long time to be executed
import 'dart:math';

Future<int> long_time() async {
  int sum = 0;
  for (var i = 0; i < 1000; i++) {
    sum += i;
  }
  return sum;
}

Stream<int> randomNumber() async* {
  final random = Random();
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield random.nextInt(100) + 1;
  }
}

void main() async {
  final val = long_time();
  val.then((value) => print(value));
  for (var i = 0; i < 10; i++) {
    print(i);
  }
  final stream = randomNumber();
  await for (var value in stream) {
    print(value);
  }
  print("Hello");
}
