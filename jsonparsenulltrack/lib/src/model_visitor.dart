import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitors extends SimpleElementVisitor<void>{
   String className = '';

   Map<String,dynamic> field = {};


   @override
   void visitConstructorElement(ConstructorElement element){
      final returnType = element.returnType.toString();
      className = returnType.replaceAll('*','');
   }

   @override
   void visitFieldElement(FieldElement element){

        field[element.name] = element.type.toString().replaceAll('*','');
        

   }


}