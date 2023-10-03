import 'package:test/test.dart';

import 'src/node.dart';
import 'src/console.dart';

void main() {
  final log = '''
\$ cd /
\$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
\$ cd a
\$ ls
dir e
29116 f
2557 g
62596 h.lst
\$ cd e
\$ ls
584 i
\$ cd ..
\$ cd ..
\$ cd d
\$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k''';

  test('Should parse ls command and its output into a Node Tree', () {
    final lsOutput = log.split('\n').skip(2).take(4);
    final r = RootDir();
    lsOutput.forEach(r.addRawChild);

    expect(r.size, equals(23352670));
    expect(r.children, hasLength(4));
  });

  test('Should parse different Commands and build the file tree', () {
    final console = Console();
    console.reviveFromLog(log);
    expect(console.root.size, equals(48381165));
    expect(console.root.getDirWithName('a').size, equals(94853));
    expect(console.root.getDirWithName('d').size, equals(24933642));
  });

  test('Should filter the directory tree using a custom predicate', () {
    final console = Console();
    console.reviveFromLog(log);

    final list = console.root.filterDirectories((dir) => dir.size < 100000);
    final dirA = console.root.getDirWithName('a');
    final dirE = dirA.getDirWithName('e');

    expect(list, contains(dirA));
    expect(list, contains(dirE));
  });
}
