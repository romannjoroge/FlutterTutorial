// General Programming

class Print<T> {
  final T obj;
  Print(this.obj);
  void printT() => print(obj);
}

T printval<T>(T obj) {
  print(obj);
  return obj;
}

List<String> global_list = [];

void main() {
  var test1 = Print<int>(3);
  test1.printT();

  var list1 = [1, 2, 3, 4];
  // ... operator is used to add the contents of one list to another list
  // ...? does the same thing but adds null safety
  var list2 = [8, 7, 6, 5, ...?list1];
  for (var i in list2) {
    print(i);
  }

  // Adding to lists using for and if statements

  // If hasFuel is true Pash is put in the list
  final hasFuel = true;
  final owners = ["Michael", "Donald", if (hasFuel) "Pash"];

  // For populates list with values from 0 to 4
  var numbers = [for (var i = 0; i < 5; i++) i];

  bool add = true;
  var list = [if (add) "Dennis"];
  global_list = list + global_list;
  for (var i in global_list) {
    print(i);
  }

  // Set - a collection of unique items
  var items = {1, 2, 3, 4, 4, 5};
  for (var item in items) {
    print(item);
  }
  print(items.contains(4));

  // Creates an unmodifiable copy of the map given as an arguement
  final m = Map<int, String>.unmodifiable({0: "Boom", 1: "Pow"});
  print(m[1]);
}
