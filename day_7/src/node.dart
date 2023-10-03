abstract class Node {
  Directory get parent;
  String get name;
  int get size;
}

mixin Directory implements Node {
  List<Node> children = [];

  List<Directory> get directories =>
      this.children.whereType<Directory>().toList();

  Directory getDirWithName(String name) =>
      this.directories.firstWhere((dir) => dir.name == name);

  List<Directory> filterDirectories(bool Function(Directory) predicate) {
    final list = <Directory>[];
    for (var dir in this.directories) {
      if(predicate.call(dir)){
        list.add(dir);
      }
      list.addAll(dir.filterDirectories(predicate));
    }
    return list;
  }

  int get size =>
      this.children.fold<int>(0, (totalSize, n) => totalSize + n.size);

  void addRawChild(String raw) {
    Node node;
    final parts = raw.split(' ');
    if (parts.first == 'dir') {
      node = Dir(parent: this, name: parts[1]);
    } else {
      node = File(
        parent: this,
        name: parts[1],
        size: int.parse(parts[0]),
      );
    }
    this.addChild(node);
  }

  void addChild(Node child) => children.add(child);
  void addChildren(List<Node> children) => children.addAll(children);

  @override
    String toString() {
      return '$name($size)';
    }
}

class RootDir with Directory {
  RootDir({
    List<Node>? children = null,
  }) : this.name = '/';
  String name;

  Directory get parent => this;
}

class Dir with Directory {
  Dir({
    required this.parent,
    required this.name,
    List<Node>? children = null,
  });

  String name;
  Directory parent;
}

class File implements Node {
  File({
    required this.parent,
    required this.name,
    required this.size,
  });

  Directory parent;
  String name;
  int size;
}
