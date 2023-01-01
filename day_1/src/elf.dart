class Elf {
  Elf();
  final items = <int>[];
  factory Elf.fromItems(List<String> items) {
    final elf = Elf();
    items.map(elf.addItem);
    return elf;
  }
  void addItem(String item) {
    items.add(int.tryParse(item) ?? 0);
  }

  int get totalCalories => items.fold(0, (p, c) => p + c);
}

extension ElfListExtension on List<Elf> {
  Elf get getElfWithMostCalories {
    var winner = this.first;
    for (final elf in this) {
      if (elf.totalCalories > winner.totalCalories) {
        winner = elf;
      }
    }
    return winner;
  }
  List<Elf> get getThreeElfsWithMostCalories {
    this.sort((a, b) => a.totalCalories.compareTo(b.totalCalories));
    return this.reversed.take(3).toList();
  }
}

extension StringListElfExtension on List<String> {
  List<Elf> get getElfs {
    final elfs = <Elf>[Elf()];
    for (final item in this) {
      if (item.isEmpty) {
        elfs.add(Elf());
      }
      elfs.last.addItem(item);
    }
    return elfs;
  }
}
