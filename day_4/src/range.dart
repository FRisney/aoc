extension RangePairFromStringExtension on String {
  List<Range> toRangePair() {
    final rangeRaws = this.split(',');
    return rangeRaws.map(Range.fromString).toList();
  }
}

class RangePair {
  RangePair(String pairRaw) {
    this.pair = pairRaw.toRangePair();
  }
  late final List<Range> pair;

  @override
  String toString() {
    return '${pair[0]},${pair[1]}';
  }

  int oneContainsOther() {
    if (pair[0].contains(pair[1]) || pair[1].contains(pair[0])) {
      return 1;
    }
    return 0;
  }

  int oneOverlapsOther() {
    if (pair[0].overlaps(pair[1])) {
      return 1;
    }
    return 0;
  }
}

class Range {
  Range({required this.start, required this.end});

  factory Range.fromString(String raw) {
    final boundaries = raw.split('-');
    return Range(
      start: int.parse(boundaries.first),
      end: int.parse(boundaries.last),
    );
  }

  final int start;
  final int end;

  @override
  String toString() {
    return '$start-$end';
  }

  bool overlaps(Range other) {
    return (end >= other.start) && (start <= other.end);
  }

  bool contains(Range other) {
    final startsWithin = other.start >= start;
    final endsWithin = other.end <= end;
    return startsWithin && endsWithin;
  }
}

