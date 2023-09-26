import 'dart:collection';
import 'dart:io';

void main() {
  final input = File('day_6/input').readAsStringSync();
  final index = getPacketMarkerIndex(input);
  print(
      'How many characters need to be processed before the first start-of-packet marker is detected?');
  print('\t$index');
}

int getPacketMarkerIndex(String stream) => getMarkerIndex(stream.runes, 4);

int getMarkerIndex(Runes stream, int markerLength) {
  final queue = ListQueue<int>();
  final iterator = stream.iterator;
  while (iterator.moveNext()) {
    queue.addLast(iterator.current);

    if (iterator.rawIndex < markerLength -1) {
      continue;
    }

    if (queue.isItemsUnique()) {
      return iterator.rawIndex + 1;
    }

    queue.removeFirst();
  }
  return -1;
}

extension CompareItems on ListQueue<int> {
  bool isItemsUnique() {
    for (var i = this.length - 1; i > 0; i--) {
      for (var j = 0; j <= i - 1; j++) {
        if (this.elementAt(i) == this.elementAt(j)) {
          return false;
        }
      }
    }
    return true;
  }
}
