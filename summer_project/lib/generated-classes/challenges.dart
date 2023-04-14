class AccountChallenges {
  TotalPoints? totalPoints;
  CategoryPoints? categoryPoints;
  List<AccountChallenges>? challenges;
  Preferences? preferences;

  AccountChallenges(
      {this.totalPoints,
      this.categoryPoints,
      this.challenges,
      this.preferences});

  AccountChallenges.fromJson(Map<String, dynamic> json) {
    totalPoints = json['totalPoints'] != null
        ? new TotalPoints.fromJson(json['totalPoints'])
        : null;
    categoryPoints = json['categoryPoints'] != null
        ? new CategoryPoints.fromJson(json['categoryPoints'])
        : null;
    if (json['challenges'] != null) {
      challenges = <AccountChallenges>[];
      json['challenges'].forEach((v) {
        challenges!.add(AccountChallenges.fromJson(v));
      });
    }
    preferences = json['preferences'] != null
        ? new Preferences.fromJson(json['preferences'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalPoints != null) {
      data['totalPoints'] = this.totalPoints!.toJson();
    }
    if (this.categoryPoints != null) {
      data['categoryPoints'] = this.categoryPoints!.toJson();
    }
    if (this.challenges != null) {
      data['challenges'] = this.challenges!.map((v) => v.toJson()).toList();
    }
    if (this.preferences != null) {
      data['preferences'] = this.preferences!.toJson();
    }
    return data;
  }
}

class TotalPoints {
  String? level;
  int? current;
  int? max;
  double? percentile;

  TotalPoints({this.level, this.current, this.max, this.percentile});

  TotalPoints.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    current = json['current'];
    max = json['max'];
    percentile = json['percentile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['current'] = this.current;
    data['max'] = this.max;
    data['percentile'] = this.percentile;
    return data;
  }
}

class CategoryPoints {
  TotalPoints? tEAMWORK;
  TotalPoints? eXPERTISE;
  TotalPoints? iMAGINATION;
  TotalPoints? cOLLECTION;
  TotalPoints? vETERANCY;

  CategoryPoints(
      {this.tEAMWORK,
      this.eXPERTISE,
      this.iMAGINATION,
      this.cOLLECTION,
      this.vETERANCY});

  CategoryPoints.fromJson(Map<String, dynamic> json) {
    tEAMWORK = json['TEAMWORK'] != null
        ? new TotalPoints.fromJson(json['TEAMWORK'])
        : null;
    eXPERTISE = json['EXPERTISE'] != null
        ? new TotalPoints.fromJson(json['EXPERTISE'])
        : null;
    iMAGINATION = json['IMAGINATION'] != null
        ? new TotalPoints.fromJson(json['IMAGINATION'])
        : null;
    cOLLECTION = json['COLLECTION'] != null
        ? new TotalPoints.fromJson(json['COLLECTION'])
        : null;
    vETERANCY = json['VETERANCY'] != null
        ? new TotalPoints.fromJson(json['VETERANCY'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tEAMWORK != null) {
      data['TEAMWORK'] = this.tEAMWORK!.toJson();
    }
    if (this.eXPERTISE != null) {
      data['EXPERTISE'] = this.eXPERTISE!.toJson();
    }
    if (this.iMAGINATION != null) {
      data['IMAGINATION'] = this.iMAGINATION!.toJson();
    }
    if (this.cOLLECTION != null) {
      data['COLLECTION'] = this.cOLLECTION!.toJson();
    }
    if (this.vETERANCY != null) {
      data['VETERANCY'] = this.vETERANCY!.toJson();
    }
    return data;
  }
}

class Challenges {
  int? challengeId;
  double? percentile;
  String? level;
  int? value;
  int? achievedTime;
  int? position;
  int? playersInLevel;

  Challenges(
      {this.challengeId,
      this.percentile,
      this.level,
      this.value,
      this.achievedTime,
      this.position,
      this.playersInLevel});

  Challenges.fromJson(Map<String, dynamic> json) {
    challengeId = json['challengeId'];
    percentile = json['percentile'];
    level = json['level'];
    value = json['value'];
    achievedTime = json['achievedTime'];
    position = json['position'];
    playersInLevel = json['playersInLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['challengeId'] = this.challengeId;
    data['percentile'] = this.percentile;
    data['level'] = this.level;
    data['value'] = this.value;
    data['achievedTime'] = this.achievedTime;
    data['position'] = this.position;
    data['playersInLevel'] = this.playersInLevel;
    return data;
  }
}

class Preferences {
  String? bannerAccent;
  String? title;
  List<int>? challengeIds;

  Preferences({this.bannerAccent, this.title, this.challengeIds});

  Preferences.fromJson(Map<String, dynamic> json) {
    bannerAccent = json['bannerAccent'];
    title = json['title'];
    challengeIds = json['challengeIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerAccent'] = this.bannerAccent;
    data['title'] = this.title;
    data['challengeIds'] = this.challengeIds;
    return data;
  }
}
