abstract class Weapon implements Comparable {
  const Weapon({required this.aliases, required this.score});
  final List<String> aliases;
  final int score;

  static List<Weapon> build(String guideSegment) {
    final chosen = <Weapon>[];
    final pair = guideSegment.split(' ');
    final weapons = [Rock(), Paper(), Scisors()];
    for (final alias in pair) {
      for (final weapon in weapons) {
        if (weapon.aliases.contains(alias)) {
          chosen.add(weapon);
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
  Paper() : super(aliases: const ['B', 'Y'], score: 2);

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
  Scisors() : super(aliases: const ['C', 'Z'], score: 3);

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
  Rock() : super(aliases: const ['A', 'X'], score: 1);

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
