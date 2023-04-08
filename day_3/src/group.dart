import 'rucksack.dart';

class Group {
  Group(List<RuckSack> rucksacks) {
    this.rucksacks = rucksacks;
  }

  late List<RuckSack> rucksacks;

  String findBadge() {
    return String.fromCharCode(
      rucksacks[0]
          .findBadge(
            rucksacks[1].findBadge(
              rucksacks[2].items,
            ),
          )
          .first,
    );
    /* return 'a'; */
    /* final badges = [ */
    /*     rucksacks[0].findBadge(rucksacks[2]), */
    /*     rucksacks[1].findBadge(rucksacks[0]), */
    /*     rucksacks[2].findBadge(rucksacks[1]), */
    /* ]; */
    /* if (badges[0] == badges[1] && badges[0] == badges[2]) */
    /* return String.fromCharCode(badges[0]); */
    /* else return null; */
  }
}
