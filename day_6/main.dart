import 'dart:collection';
import 'dart:io';

void main() {
    final input = File('day_6/input').readAsStringSync();
    final index = getMarkerIndex(input.runes);
    print('How many characters need to be processed before the first start-of-packet marker is detected?');
    print('\t$index');
  }

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
