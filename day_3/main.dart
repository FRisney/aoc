import 'dart:io';

import 'src/rucksack.dart';

void main() {
    var sum = 0;
    final file = File('day_3/input');
    final cargo = file.readAsLinesSync();
    for(final content in cargo){
        final sack = RuckSack(content);
        sum += sack.getDuplicatePriority();
    }
    print('Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?');
    print('\t$sum');
}
