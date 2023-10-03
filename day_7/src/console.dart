import 'node.dart';

class Console {
  Console() {
    final r = RootDir();
    this.currentDir = r;
    this.root = r;
  }
  late RootDir root;
  late Directory currentDir;

  reviveFromLog(String log) {
    var lsDir = false;
    final rawCommands = log.split('\n');
    final iterator = rawCommands.iterator;

    while (iterator.moveNext() && iterator.current.isNotEmpty) {
      if (iterator.current.startsWith('\$')) {
        lsDir = false;
        final cmd = iterator.current.split(' ');

        if (cmd[1] == 'ls') {
          lsDir = true;
        } else if (cmd[1] == 'cd') {
          currentDir = switch (cmd[2]) {
            '/' => currentDir = root,
            '..' => currentDir = currentDir.parent,
            _ => currentDir.getDirWithName(cmd[2]),
          };
        }
      } else if (lsDir) {
        currentDir.addRawChild(iterator.current);
      }
    }
  }
}
