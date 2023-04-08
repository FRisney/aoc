import 'dart:io';

import 'src/rucksack.dart';
import 'src/group.dart';

void main() {
  var sumOfDuplicates = 0, sumOfBadges = 0;
  final all = <RuckSack>[];
  File('day_3/input') //
      .readAsLinesSync()
      .forEach(all.addRucksackFromString);
  for (final sack in all) {
    sumOfDuplicates += sack.getDuplicatePriority();
  }
  for (int i = 0; i < all.length; i = i + 3) {
    final group = Group(all.getRange(i, i + 3).toList());
    sumOfBadges += RuckSack.calculatePriority(group.findBadge());
  }
  print('Find the item type that appears in both compartments of each rucksack.'
      ' What is the sum of the priorities of those item types?');
  print('\t$sumOfDuplicates');
  print(
      'Find the item type that corresponds to the badges of each three-Elf group.'
      ' What is the sum of the priorities of those item types?');
  print('\t$sumOfBadges');
}
