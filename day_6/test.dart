import 'package:test/test.dart';
import 'main.dart';

void main() {
  Map<String, int> markers = {
    'mjqjpqmgbljsphdztnvjfqwrcgsmlb': 7,
    'bvwbjplbgvbhsrlpgdmjqwftvncz': 5,
    'nppdvjthqldpwncqszvftbrmjlhg': 6,
    'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg': 10,
    'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw': 11,
  };
  group('Should get the index of the marker', () {
    for (var markerEntry in markers.entries) {
      test(markerEntry.key, () {
        final index = getPacketMarkerIndex(markerEntry.key);
        expect(index, equals(markerEntry.value));
      });
    }
  });
}
