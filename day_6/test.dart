import 'package:test/test.dart';
import 'main.dart';

void main() {
  Map<String, List<int>> markers = {
    'mjqjpqmgbljsphdztnvjfqwrcgsmlb': [7, 19],
    'bvwbjplbgvbhsrlpgdmjqwftvncz': [5, 23],
    'nppdvjthqldpwncqszvftbrmjlhg': [6, 23],
    'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg': [10, 29],
    'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw': [11, 26],
  };
  group('Should get the index of the', () {
    for (var markerEntry in markers.entries) {
      test('packet marker for ${markerEntry.key}', () {
        final index = getPacketMarkerIndex(markerEntry.key);
        expect(index, equals(markerEntry.value[0]));
      });
      test('message marker for ${markerEntry.key}', () {
        final index = getMessageMarkerIndex(markerEntry.key);
        expect(index, equals(markerEntry.value[1]));
      });
    }
  });
}
