// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// Generator: JsonGnerator
// **************************************************************************

class PersonGen {
  final String name;
  final int? age;
  final Map<String, String?>? map;
  PersonGen({
    required this.name,
    required this.age,
    required this.map,
  });
  factory PersonGen.fromJson(dynamic data) {
    if (data["age"] == null) {
      throw NullSetException(
          whereNull: '"Person.fromJson(data) age ${data["age"]}"');
    }
    if (data["map"] == null) {
      throw NullSetException(
          whereNull: '"Person.fromJson(data) map ${data["map"]}"');
    }
    return PersonGen(
      name: data["name"],
      age: data["age"],
      map: data["map"],
    );
  }
}
