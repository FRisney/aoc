class Depot {
  final stacks = <int, List<Runes>>{};

  addToStack(int name, Runes value) {
    if (stacks[name] == null) {
      newStack(name);
    }
    stacks[name]!.add(value);
  }

  newStack(int name) {
    stacks[name] = <Runes>[];
  }

  @override
  String toString() {
    var result = "";
    for (var stack in stacks.entries) {
      for (var crate in stack.value) {
        result += "'${crate.string}' ";
      }
      result = result.substring(0, result.length - 1);
      result += "\n";
    }
    return result;
  }
}
