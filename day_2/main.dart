import 'dart:io';

import 'src/rps.dart';

void main() {
  final game = Game();
  final file = File('day_2/input');
  final rounds = file.readAsLinesSync();
  for(final round in rounds){
      final weps = Weapon.build(round);
      game.play(weps[1],weps[0]);
  }
  print('Following the Elf\'s instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?');
  print('\t${game.totalScore}');
}
