import 'dart:io';
import 'src/range.dart';

void main() {
  final rangePairs =
      File('day_4/input').readAsLinesSync().map(RangePair.new).toList();
  final pairsThatContainsTheOther = rangePairs
      .map((range) => range.oneContainsOther())
      .fold(0, (previousValue, pairContains) => pairContains + previousValue);
  final pairsThatOverlapsTheOther = rangePairs
      .map((range) => range.oneOverlapsOther())
      .fold(0, (previousValue, pairOverlaps) => pairOverlaps + previousValue);
  print('In how many assignment pairs does one range fully contain the other?');
  print('\t$pairsThatContainsTheOther');
  print('\tIn how many assignment pairs do the ranges overlap?');
  print('\t$pairsThatOverlapsTheOther');
}
