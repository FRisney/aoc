import 'dart:io';

import 'src/console.dart';

void main() {
  final log = File('day_7/input').readAsStringSync();

  final console = Console();
  console.reviveFromLog(log);

  final list = console.root.filterDirectories((dir) => dir.size < 100000);

  final sumDirSize = list.fold<int>(0, (size, dir) => size + dir.size);

  print('Find all of the directories with a total size of at most 100000.\nWhat is the sum of the total sizes of those directories?');
  print("\t$sumDirSize");
}
