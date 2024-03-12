library generators;

import 'package:build/build.dart';
import 'package:jsonparsenulltrack/src/factorgenerator.dart';
import 'package:source_gen/source_gen.dart';
export 'package:jsonparsenulltrack/annotation/annoatation.dart';


Builder generateJsonClass(BuilderOptions builderOptions) => SharedPartBuilder(
  [JsonGnerator()], 'json_generators'
);


