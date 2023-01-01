import 'dart:io';
import 'src/elf.dart';

void main() {
    final file = File('day_1/input');
    final input = file.readAsLinesSync();
    final elfs = input.getElfs;
    print('Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?');
    print('\t${elfs.getElfWithMostCalories.totalCalories}');
}
