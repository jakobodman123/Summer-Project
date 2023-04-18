import 'dart:collection';

class SupportMethods {
  List<dynamic> getMapString(List<String>? list) {
    var map = Map();
    list!.forEach((e) => map.update(e, (x) => x + 1, ifAbsent: () => 1));

    var sortedKeys = map.keys.toList(growable: false)
      ..sort((k1, k2) => map[k2].compareTo(map[k1]));
    LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => map[k]);
    var sortedList = sortedMap.keys.toList();
    return sortedList;
  }
}
