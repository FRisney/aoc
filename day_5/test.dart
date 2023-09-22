import 'package:test/test.dart';

import 'src/Crane.dart';
import 'src/Depot.dart';
import 'src/Instruction.dart';
import 'src/Parser.dart';

void main() {
  final input = """
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
""";

  test('Should parse the stack and the instructions', () {
    final parser = Parser();
    parser.parse(input);

    expect(parser.depot.stacks.keys, contains(1));
    expect(parser.depot.stacks[2]!, hasLength(3));

    expect(parser.instructions, hasLength(4));
    expect(parser.instructions[2].quantity, equals(2));
    expect(parser.instructions[2].origin, equals(2));
    expect(parser.instructions[2].destiny, equals(1));
  });

  test('Crane should move the stacks correctly', () {
    final parser = Parser();
    parser.parse(input);
    final crane = Crane(
      depot: parser.depot,
      instructions: parser.instructions,
    );

    crane.executeInstructions();

    expect(crane.instructions, isNot(contains(parser.instructions.first)));

    expect(crane.depot.stacks, isNot(containsPair(1, [Runes('Z'),Runes('N')])));
    expect(parser.depot.stacks, containsPair(2, [Runes('M')]));

    expect(crane.getLastRow(), equals('CMZ'));
  });
}
