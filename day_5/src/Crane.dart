import 'Depot.dart';
import 'Instruction.dart';

class Crane {
  final instructions = <Instruction>[];
  Depot depot;

  Crane({
    required this.depot,
    required List<Instruction> instructions,
  }) {
    instructions.forEach((instruction) {
      this.instructions.add(instruction);
    });
  }

  void executeInstructions() {
    for (final instruction in this.instructions) {
      for (int q = 0; q < instruction.quantity; q++) {
        final taken = depot.stacks[instruction.origin]!.removeLast();
        depot.stacks[instruction.destiny]!.add(taken);
      }
    }
    instructions.clear();
  }

  String getLastRow() {
    var result = '';
    for (final stack in depot.stacks.entries) {
      result += stack.value.last.string;
    }
    return result;
  }
}
