import 'dart:collection';

void main() {}

int getMarkerIndex(Runes stream) {
  final queue = ListQueue<int>();
  final iterator = stream.iterator;
  while (iterator.moveNext()) {
    queue.addLast(iterator.current);

    if (iterator.rawIndex < 4) {
      continue;
    }

    if (queue.isItemsUnique()) {
      return iterator.rawIndex;
    }

    queue.removeFirst();
  }
  return -1;
}

extension CompareFirstFourItems on ListQueue<int> {
  bool isItemsUnique() {
    return !(this.elementAt(0) == this.elementAt(1) ||
        this.elementAt(0) == this.elementAt(2) ||
        this.elementAt(0) == this.elementAt(3) ||
        this.elementAt(1) == this.elementAt(2) ||
        this.elementAt(1) == this.elementAt(3) ||
        this.elementAt(2) == this.elementAt(3));
  }
}
