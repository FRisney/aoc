import 'package:test/test.dart';
import 'src/rucksack.dart';

void main() {
  test('Given a rucksack, should get the duplicate item', () {
    final sack = RuckSack('vJrwpWtwJgWrhcsFMMfFFhFp');
    final duplicate = sack.findDuplicates().first;
    expect(duplicate, 'p');
  });

  test('Given a item, calculate correct priority', () {
    final sack = RuckSack('');
    final priority = sack.calculatePriority('p');
    expect(priority, 16);
  });

  test(
      'Given a number of rucksacks, calculate the total sum of duplicate items priorities',
      () {
    final sum = RuckSack('ttgJtRGJQctTZtZT').getDuplicatePriority() +
        RuckSack('wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn').getDuplicatePriority() +
        RuckSack('jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL').getDuplicatePriority() +
        RuckSack('vJrwpWtwJgWrhcsFMMfFFhFp').getDuplicatePriority() +
        RuckSack('CrZsJsPPZsGzwwsLwLmpwMDw').getDuplicatePriority() +
        RuckSack('PmmdzqPrVvPwwTWBwg').getDuplicatePriority();
    expect(sum, 157);
  });
}
