import 'package:test/test.dart';
import 'src/rucksack.dart';
import 'src/group.dart';

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

  test('Given a list of strings, build a list of rucksacks using addRucksackFromString extension method', () {
    final all = <RuckSack>[];
    final content = [
      'vJrwpWtwJgWrhcsFMMfFFhFp',
      'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
      'PmmdzqPrVvPwwTWBwg',
    ];
    content.forEach(all.addRucksackFromString);
    final r = RuckSack(content.first);
    expect(
      all.first.items,
      r.items,
    );
  });

  test('Given a group of rucksacks, get the unique item aomng them', () {
    final group = Group([
      'vJrwpWtwJgWrhcsFMMfFFhFp',
      'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
      'PmmdzqPrVvPwwTWBwg',
    ].toRuckSacks());
    final badge = group.findBadge();
    expect(badge, 'r');
  });
}
