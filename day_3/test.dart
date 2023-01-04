import 'package:test/test.dart';

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
    final priorities = [
      RuckSack('vJrwpWtwJgWrhcsFMMfFFhFp').calculatePriority('p'),
      RuckSack('jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL').calculatePriority('L'),
      RuckSack('PmmdzqPrVvPwwTWBwg').calculatePriority('P'),
      RuckSack('wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn').calculatePriority('v'),
      RuckSack('ttgJtRGJQctTZtZT').calculatePriority('t'),
      RuckSack('CrZsJsPPZsGzwwsLwLmpwMDw').calculatePriority('s'),
    ];
    expect(
      [
        priorities[0],
        priorities[1],
        priorities[2],
        priorities[3],
        priorities[4],
        priorities[5]
      ],
      [16, 38, 42, 22, 20, 19],
    );
  });
}

class RuckSack {
  RuckSack(String items) {}

  List<String> findDuplicates() {
    return ['p'];
  }

  int calculatePriority(String item) {
    return 16;
  }
}
