// Classes

library coordinates.dart; // Creates a library called coordinate.dart

class Coordinate {
  final String
      _point; // Putting underscore makes members only available in file they were made
  int _x;
  int _y;

  // The data members are initialized immediately they are created
  Coordinate(String p, int a, int b)
      : _point = p,
        _x = a,
        _y = b {
    print("Coordinate created!");
  }

  // A variation of the constructor
  Coordinate.zero() : this("O", 0, 0);

  // Makes the data members editable
  void set y(int a) => _y = a;
  void set x(int a) => _x = a;

  // Makes the variables read only
  int get x => _x;
  int get y => _y;
}

void main() {
  Coordinate c1 = Coordinate.zero();
  Coordinate c2 = Coordinate("A", 0, 1);
  print(c1._point);
  print(c2.x);
}
