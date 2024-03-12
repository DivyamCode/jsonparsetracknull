// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
// ignore: implementation_imports
import 'package:build/src/builder/build_step.dart';
import 'package:jsonparsenulltrack/annotation/annoatation.dart';
import 'package:jsonparsenulltrack/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGnerator extends GeneratorForAnnotation<JsonParseTrackNull> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitors();

    element.visitChildren(visitor);

    final buffer = StringBuffer();

    buffer.writeln('class ${visitor.className}Gen  {');

    for (var i = 0; i < visitor.field.length; i++) {
      buffer.writeln(
          'final ${visitor.field.values.elementAt(i)} ${visitor.field.keys.elementAt(i)};');
    }

    buffer.writeln('${visitor.className}Gen({');

    for (var i = 0; i < visitor.field.length; i++) {
      buffer.writeln('required this.${visitor.field.keys.elementAt(i)},');
    }

    buffer.writeln('});');

    writeFromJson(buffer: buffer, visitor: visitor);

    buffer.writeln('}');

    return buffer.toString();
  }

  void writeFromJson(
      {required StringBuffer buffer, required ModelVisitors visitor}) {
    buffer.writeln('factory ${visitor.className}Gen.fromJson(dynamic data){');
    // buffer.writeln('static ${visitor.className}Gen fromJson(dynamic data){');

    for (var i = 0; i < visitor.field.length; i++) {
      // if ((visitor.field.values.elementAt(i) as String).contains('?')) {
      if ((visitor.field.values.elementAt(i) as String)[
              (visitor.field.values.elementAt(i) as String).length - 1] ==
          '?') {
        buffer.writeln('if(data["${visitor.field.keys.elementAt(i)}"]==null){');

        buffer.writeln(
            '''throw NullSetException(whereNull:'"Person.fromJson(data) ${visitor.field.keys.elementAt(i)} \${data["${visitor.field.keys.elementAt(i)}"]}"');''');

        buffer.writeln('}');
      }
    }

    writeJsonClass(buffer: buffer, visitor: visitor);

    buffer.writeln('}');
  }

  void writeJsonClass(
      {required StringBuffer buffer, required ModelVisitors visitor}) {
    buffer.writeln('return ${visitor.className}Gen(');

    for (var i = 0; i < visitor.field.length; i++) {
      buffer.writeln(
          '${visitor.field.keys.elementAt(i)}:data["${visitor.field.keys.elementAt(i)}"],');
    }

    buffer.writeln(');');
  }
}
