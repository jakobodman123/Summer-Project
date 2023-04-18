import 'package:summer_project/generated-classes/matchStats.dart';

class ApiMethods {
  String server = "EUW1";
  Future<int> findPersonUsingLoop(
      List<Participants>? people, String? summonerName) async {
    if (people != null && summonerName != null) {
      final index = people.indexWhere((person) =>
          person.summonerName?.toLowerCase() == summonerName.toLowerCase());
      if (index != -1) {
        // Found the person
        return index;
      }
    }
    return -1;
  }
}
