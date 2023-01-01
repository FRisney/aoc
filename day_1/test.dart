import 'package:test/test.dart';
import 'src/elf.dart';

void main() {
  late final List<Elf> elfs;
  final input = <String>[
    '1',
    '2',
    '3',
    '',
    '4',
    '',
    '5',
    '6',
    '',
    '7',
    '8',
    '9',
    '',
    '10',
  ];

  test('Should separate the input in a List of Elfs', () {
    elfs = input.getElfs;
    final calories = <int>[];
    for (final elf in elfs) {
      calories.add(elf.totalCalories);
    }
    expect(calories, [6, 4, 11, 24, 10]);
  });

  test('Should get the elf that carries the most calories', () {
    final elf = elfs.getElfWithMostCalories;
    expect(elf.totalCalories, 24);
  });
}
