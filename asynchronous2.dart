import 'package:bloc/bloc.dart';

Stream<int> asyncExample() async* {
  // A function that sends numbers from 1 to 10 and puts a pause of 2 seconds
  // between each number sent
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void listener() async {
  // A function that listens to the stream and prints the data received from it
  Stream<int> no_stream = asyncExample();
  no_stream.listen(
      (receivedData) => print("Received data is " + receivedData.toString()));
}

// Cubits
// Cubits are similar to blocs but they have less functionality
// Can remember state and can have method functions that change the state
class CounterCubit extends Cubit<int> {
  CounterCubit()
      : super(0); // Constructor that sets the initial state of the cubit

  // Functions that change the state stored by the cubit
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main() {
  listener();
  print("Will this be executed first or last");

  final cubit = CounterCubit();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state); 
}
