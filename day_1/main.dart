import 'dart:io';
import 'src/elf.dart';

void main() {
    final file = File('day_1/input');
    final input = file.readAsLinesSync();
    final elfs = input.getElfs;
    final calories = elfs.getElfWithMostCalories.totalCalories;
    final topElfs = elfs.getThreeElfsWithMostCalories;
    final topCalories = topElfs.fold(0,(prev,e)=>prev+e.totalCalories);
    print('Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?');
    print('\t$calories');
    print('\tFind the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?');
    print('\t$topCalories');
}
