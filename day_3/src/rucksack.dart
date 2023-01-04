class RuckSack {
  RuckSack(String items) {
    final compartSize = items.length ~/ 2;
    final r = items.runes.toList();
    left = r.take(compartSize).toList();
    right = r.reversed.take(compartSize).toList();
  }

  late final List<int> left;
  late final List<int> right;

  List<String> findDuplicates() {
    final runes = left.toList();
    runes.retainWhere(right.contains);
    return runes.map(String.fromCharCode).toList();
  }

  int calculatePriority(String item) {
    if (item.length > 1) throw 'Not a character';
    var rune = item.runes.first;
    rune -= (rune > 96) ? 96 : 38;
    return rune;
  }

  int getDuplicatePriority() {
    return calculatePriority(findDuplicates().first);
  }
}
