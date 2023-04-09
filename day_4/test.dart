import 'package:test/test.dart';
import 'src/range.dart';

void main() {
  late List<String> raws;
  late List<RangePair> pairs;
  setUp(() {
    raws = ['2-4,6-8', '2-3,4-5', '5-7,7-9', '2-8,3-7', '6-6,4-6', '2-6,4-8'];
    pairs = raws.map(RangePair.new).toList();
  });
  test('Given the list of string build the correct ranges', () {
    expect(
      pairs.first.toString(),
      raws.first,
    );
  });

  test('verify if one of the ranges in the pair contains the other', () {
    expect(pairs[0].oneContainsOther(), 0);
    expect(pairs[1].oneContainsOther(), 0);
    expect(pairs[2].oneContainsOther(), 0);
    expect(pairs[3].oneContainsOther(), 1);
    expect(pairs[4].oneContainsOther(), 1);
    expect(pairs[5].oneContainsOther(), 0);
  });

  test('verify if one of the ranges in the pair overlaps the other', () {
    expect(pairs[0].oneOverlapsOther(), 0, reason: '${pairs[0]}');
    expect(pairs[1].oneOverlapsOther(), 0, reason: '${pairs[1]}');
    expect(pairs[2].oneOverlapsOther(), 1, reason: '${pairs[2]}');
    expect(pairs[3].oneOverlapsOther(), 1, reason: '${pairs[3]}');
    expect(pairs[4].oneOverlapsOther(), 1, reason: '${pairs[4]}');
    expect(pairs[5].oneOverlapsOther(), 1, reason: '${pairs[5]}');
  });
}
