import "package:equatable/equatable.dart";

void main() {
  final a = Person(name: "name");
  final b = Person(name: "namde");

  print("${a == b}");
}

class Person extends Equatable {
  final String name;
  Person({required this.name});

  @override
  List<Object?> get props => [name];
}
