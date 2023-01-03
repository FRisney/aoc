import 'weapon.dart';

class Game {
  final rounds = <int>[];

  int play(final Weapon mine, Weapon theirs) {
    var score = mine.compareTo(theirs);
    if (score == 0) {
      score = mine.score + 3;
    } else if (score < 0) {
      score = mine.score;
    } else if (score > 0) {
      score = mine.score + 6;
    }
    rounds.add(score);
    return score;
  }

  int get totalScore => rounds.fold(0, (prev, curr) => prev + curr);
}
