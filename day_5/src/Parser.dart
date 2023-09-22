import 'Depot.dart';
import 'Instruction.dart';

class Parser {
  final depot = Depot();
  final instructions = <Instruction>[];

  void parse(String input) {
    var separationIndex = -1;
    final lines = input.split('\n');

    // get the index of the separation of the
    // declarations for the stacks and the instructions
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (line.isEmpty) {
        separationIndex = i;
        break;
      }
    }

    // get stacks
    final stackListIndex = separationIndex - 1;
    final stacksList = lines[stackListIndex].split('   ');

    for (var i = stackListIndex - 1; i >= 0; i--) {
      final crates = <String>[];
      for (int j = 1; j < lines[i].length; j += 4) {
        final char = lines[i].substring(j, j + 1);
        crates.add(char);
      }

      for (int j = 0; j < stacksList.length; j++) {
        if (crates[j] != ' ') {
          depot.addToStack(j + 1, crates[j].runes);
        }
      }
    }

    // get instructions
    for (var i = separationIndex + 1; i < lines.length - 1; i++) {
      final line = lines[i].split(' ');
      final inst = Instruction(
        origin: int.parse(line[3]),
        destiny: int.parse(line[5]),
        quantity: int.parse(line[1]),
      );
      instructions.add(inst);
    }
  }
}
