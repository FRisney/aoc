import 'package:test/test.dart';
import 'src/rps.dart';

void main() {
  test('When I play Scisors, should beat Paper', () {
    final score = Scisors().compareTo(Paper());
    expect(score, 1);
  });

  test('When I play Paper, should beat Rock', () {
    final score = Paper().compareTo(Rock());
    expect(score, 1);
  });

  test('When I play Rock, should beat Scisors', () {
    final score = Rock().compareTo(Scisors());
    expect(score, 1);
  });

  test('Given the guide, should get correct choices', () {
    final rxp = Weapon.build('A Y');
    final pxr = Weapon.build('B X');
    final sxs = Weapon.build('C Z');

    expect(rxp, [Rock(), Rock()]);
    expect(pxr, [Paper(), Rock()]);
    expect(sxs, [Scisors(), Rock()]);
  });

  test('Given the guide, should get correct total score', () {
    final game = Game();
    for (final r in ['A Y', 'B X', 'C Z']) {
      final weps = Weapon.build(r);
      game.play(weps[1], weps[0]);
    }
    print(game.rounds);
    expect(game.totalScore, 12);
  });
}
