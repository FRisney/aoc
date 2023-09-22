import 'dart:io';

import 'src/Crane.dart';
import 'src/Parser.dart';

void main(List<String> args) {
  final input = File('day_5/input').readAsStringSync();
  final parser = Parser();

  parser.parse(input);

  final crane = Crane(
    depot: parser.depot,
    instructions: parser.instructions,
  );

  crane.executeInstructions();
  final topRow = crane.getLastRow();
  print("After the rearrangement procedure completes, what crate ends up on top of each stack?");
  print("\t$topRow");
}
