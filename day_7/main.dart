import 'dart:io';

import 'src/console.dart';

void main() {
  const DISCSPACE = 70000000;
  const UPDATESIZE=30000000;
  final log = File('day_7/input').readAsStringSync();

  final console = Console();
  console.reviveFromLog(log);

  var list = console.root.filterDirectories((dir) => dir.size < 100000);

  final sumDirSize = list.fold<int>(0, (size, dir) => size + dir.size);

  print('Find all of the directories with a total size of at most 100000.\nWhat is the sum of the total sizes of those directories?');
  print("\t$sumDirSize");

  final availableSpace = DISCSPACE - console.root.size;
  final neededSpace = UPDATESIZE - availableSpace;

  list = console.root.filterDirectories((dir) => dir.size > neededSpace);
  list.sort((current, comparable) => current.size.compareTo(comparable.size));
  final smallestDirSize = list.first.size;

  print('Find the smallest directory that, if deleted, would free up enough space on the filesystem to run the update. What is the total size of that directory?');
  print('\t$smallestDirSize');
}
