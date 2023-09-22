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
      final stack = depot.stacks[instruction.origin]!;
      final taken = <Runes>[];
      final initialPosition = stack.length - instruction.quantity;
      for (int i = initialPosition; i < stack.length; i++) {
        taken.add(stack[i]);
      }
      depot.stacks[instruction.destiny]!.addAll(taken);
      taken.forEach(stack.remove);
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
