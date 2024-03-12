// ignore: depend_on_referenced_packages
import 'package:jsonparsenulltrack/generators.dart';
part 'person.g.dart';

@trackNull
class Person {
   String name;
   int? age;
   Map<String,String?>? map;
   Person({
    required this.age,  
    required this.name,
    required this.map
   });

}

class NullSetException implements Exception {
    String whereNull;
    NullSetException({required this.whereNull});
}