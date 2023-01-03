abstract class Weapon implements Comparable {
  const Weapon({required this.alias, required this.score});
  final String alias;
  final int score;

  static List<Weapon> build(String guideSegment) {
    final chosen = <Weapon>[];
    final pair = guideSegment.split(' ');
    final weapons = [Rock(), Paper(), Scisors()];
    final conditions = {'Y': 0, 'X': -1, 'Z': 1};
    for (final alias in pair) {
      for (final weapon in weapons) {
        if (chosen.isEmpty) {
          if (weapon.alias == alias) {
            chosen.add(weapon);
          }
        } else {
          if (weapon.compareTo(chosen[0]) == conditions[pair[1]]) {
            chosen.add(weapon);
          }
        }
      }
    }
    return chosen;
  }

  bool operator ==(Object counter) {
    return counter is Weapon && counter.score == score;
  }

  @override
  String toString() {
    return runtimeType.toString();
  }
}

class Paper extends Weapon {
  Paper() : super(alias: 'B', score: 2);

  @override
  int compareTo(other) {
    if (other is Weapon) {
      if (other is Rock) {
        return 1;
      } else if (other is Scisors) {
        return -1;
      }
    }
    return 0;
  }
}

class Scisors extends Weapon {
  Scisors() : super(alias: 'C', score: 3);

  @override
  int compareTo(other) {
    if (other is Weapon) {
      if (other is Paper) {
        return 1;
      } else if (other is Rock) {
        return -1;
      }
    }
    return 0;
  }
}

class Rock extends Weapon {
  Rock() : super(alias: 'A', score: 1);

  @override
  int compareTo(other) {
    if (other is Weapon) {
      if (other is Scisors) {
        return 1;
      } else if (other is Paper) {
        return -1;
      }
    }
    return 0;
  }
}
