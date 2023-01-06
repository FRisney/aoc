import 'rucksack.dart';

class Group {
  Group(List<String> rucksacks) {
    this.rucksacks = rucksacks.map(RuckSack.new).toList();
  }

  late List<RuckSack> rucksacks;

  String? findBadge() {
    rucksacks[0].findBadge(
      rucksacks[1].findBadge(
        rucksacks[2].items,
      ),
    );
    return 'a';
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
