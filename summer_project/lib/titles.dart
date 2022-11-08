class ChallengeTitles {
  int? lastUpdated;
  Tiers? tiers;
  Titles? titles;
  String? source;

  ChallengeTitles({this.lastUpdated, this.tiers, this.titles, this.source});

  ChallengeTitles.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last-updated'];
    tiers = json['tiers'] != null ? new Tiers.fromJson(json['tiers']) : null;
    titles =
        json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last-updated'] = this.lastUpdated;
    if (this.tiers != null) {
      data['tiers'] = this.tiers!.toJson();
    }
    if (this.titles != null) {
      data['titles'] = this.titles!.toJson();
    }
    data['source'] = this.source;
    return data;
  }
}

class Tiers {
  String? s00;
  String? s01;
  String? s02;
  String? s03;
  String? s04;
  String? s05;
  String? s06;
  String? s07;
  String? s08;

  Tiers(
      {this.s00,
      this.s01,
      this.s02,
      this.s03,
      this.s04,
      this.s05,
      this.s06,
      this.s07,
      this.s08});

  Tiers.fromJson(Map<String, dynamic> json) {
    s00 = json['00'];
    s01 = json['01'];
    s02 = json['02'];
    s03 = json['03'];
    s04 = json['04'];
    s05 = json['05'];
    s06 = json['06'];
    s07 = json['07'];
    s08 = json['08'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['00'] = this.s00;
    data['01'] = this.s01;
    data['02'] = this.s02;
    data['03'] = this.s03;
    data['04'] = this.s04;
    data['05'] = this.s05;
    data['06'] = this.s06;
    data['07'] = this.s07;
    data['08'] = this.s08;
    return data;
  }
}

class Titles {
  String? s1;
  String? s10100006;
  String? s10110005;
  String? s10110403;
  String? s10120005;
  String? s10120303;
  String? s10120601;
  String? s10130005;
  String? s10130604;
  String? s10300006;
  String? s10310005;
  String? s10320005;
  String? s10320103;
  String? s10320303;
  String? s10320503;
  String? s10320704;
  String? s10330005;
  String? s10330202;
  String? s10330404;
  String? s12000006;
  String? s20100006;
  String? s20100204;
  String? s20100304;
  String? s20200006;
  String? s20210005;
  String? s20210104;
  String? s20220005;
  String? s20220204;
  String? s20230005;
  String? s20230204;
  String? s20300006;
  String? s20310005;
  String? s20310203;
  String? s20310302;
  String? s20320005;
  String? s20320104;
  String? s20330005;
  String? s20330103;
  String? s20330204;
  String? s20340005;
  String? s20340502;
  String? s20340804;
  String? s20400006;
  String? s20410005;
  String? s20410204;
  String? s20420005;
  String? s20420202;
  String? s21000006;
  String? s21000104;
  String? s21000406;
  String? s21000506;
  String? s30100006;
  String? s30110005;
  String? s30110102;
  String? s30110203;
  String? s30120005;
  String? s30120104;
  String? s30120203;
  String? s30120504;
  String? s30130005;
  String? s30130106;
  String? s30130503;
  String? s30200006;
  String? s30210005;
  String? s30210203;
  String? s30210504;
  String? s30220005;
  String? s30220204;
  String? s30230005;
  String? s30230103;
  String? s30230302;
  String? s30230504;
  String? s30240005;
  String? s30240402;
  String? s30300006;
  String? s30320005;
  String? s30320103;
  String? s30330005;
  String? s30340005;
  String? s30350005;
  String? s40100006;
  String? s40110005;
  String? s40110104;
  String? s40110504;
  String? s40120005;
  String? s40120104;
  String? s40120204;
  String? s40120304;
  String? s40120404;
  String? s40120504;
  String? s40120604;
  String? s40130005;
  String? s40130104;
  String? s40130204;
  String? s40130304;
  String? s40130404;
  String? s40130504;
  String? s40130604;
  String? s40200006;
  String? s40210005;
  String? s40210604;
  String? s40210903;
  String? s40220005;
  String? s40220104;
  String? s40240005;
  String? s40240603;
  String? s40240802;
  String? s40250005;
  String? s40250104;
  String? s50200005;
  String? s50200104;
  String? s50400005;
  String? s50400204;
  String? s50500005;
  String? s51000006;
  String? s51000203;
  String? s51000603;
  String? s51000904;
  String? s51001104;
  String? s202200006;

  Titles(
      {this.s1,
      this.s10100006,
      this.s10110005,
      this.s10110403,
      this.s10120005,
      this.s10120303,
      this.s10120601,
      this.s10130005,
      this.s10130604,
      this.s10300006,
      this.s10310005,
      this.s10320005,
      this.s10320103,
      this.s10320303,
      this.s10320503,
      this.s10320704,
      this.s10330005,
      this.s10330202,
      this.s10330404,
      this.s12000006,
      this.s20100006,
      this.s20100204,
      this.s20100304,
      this.s20200006,
      this.s20210005,
      this.s20210104,
      this.s20220005,
      this.s20220204,
      this.s20230005,
      this.s20230204,
      this.s20300006,
      this.s20310005,
      this.s20310203,
      this.s20310302,
      this.s20320005,
      this.s20320104,
      this.s20330005,
      this.s20330103,
      this.s20330204,
      this.s20340005,
      this.s20340502,
      this.s20340804,
      this.s20400006,
      this.s20410005,
      this.s20410204,
      this.s20420005,
      this.s20420202,
      this.s21000006,
      this.s21000104,
      this.s21000406,
      this.s21000506,
      this.s30100006,
      this.s30110005,
      this.s30110102,
      this.s30110203,
      this.s30120005,
      this.s30120104,
      this.s30120203,
      this.s30120504,
      this.s30130005,
      this.s30130106,
      this.s30130503,
      this.s30200006,
      this.s30210005,
      this.s30210203,
      this.s30210504,
      this.s30220005,
      this.s30220204,
      this.s30230005,
      this.s30230103,
      this.s30230302,
      this.s30230504,
      this.s30240005,
      this.s30240402,
      this.s30300006,
      this.s30320005,
      this.s30320103,
      this.s30330005,
      this.s30340005,
      this.s30350005,
      this.s40100006,
      this.s40110005,
      this.s40110104,
      this.s40110504,
      this.s40120005,
      this.s40120104,
      this.s40120204,
      this.s40120304,
      this.s40120404,
      this.s40120504,
      this.s40120604,
      this.s40130005,
      this.s40130104,
      this.s40130204,
      this.s40130304,
      this.s40130404,
      this.s40130504,
      this.s40130604,
      this.s40200006,
      this.s40210005,
      this.s40210604,
      this.s40210903,
      this.s40220005,
      this.s40220104,
      this.s40240005,
      this.s40240603,
      this.s40240802,
      this.s40250005,
      this.s40250104,
      this.s50200005,
      this.s50200104,
      this.s50400005,
      this.s50400204,
      this.s50500005,
      this.s51000006,
      this.s51000203,
      this.s51000603,
      this.s51000904,
      this.s51001104,
      this.s202200006});

  Titles.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s10100006 = json['10100006'];
    s10110005 = json['10110005'];
    s10110403 = json['10110403'];
    s10120005 = json['10120005'];
    s10120303 = json['10120303'];
    s10120601 = json['10120601'];
    s10130005 = json['10130005'];
    s10130604 = json['10130604'];
    s10300006 = json['10300006'];
    s10310005 = json['10310005'];
    s10320005 = json['10320005'];
    s10320103 = json['10320103'];
    s10320303 = json['10320303'];
    s10320503 = json['10320503'];
    s10320704 = json['10320704'];
    s10330005 = json['10330005'];
    s10330202 = json['10330202'];
    s10330404 = json['10330404'];
    s12000006 = json['12000006'];
    s20100006 = json['20100006'];
    s20100204 = json['20100204'];
    s20100304 = json['20100304'];
    s20200006 = json['20200006'];
    s20210005 = json['20210005'];
    s20210104 = json['20210104'];
    s20220005 = json['20220005'];
    s20220204 = json['20220204'];
    s20230005 = json['20230005'];
    s20230204 = json['20230204'];
    s20300006 = json['20300006'];
    s20310005 = json['20310005'];
    s20310203 = json['20310203'];
    s20310302 = json['20310302'];
    s20320005 = json['20320005'];
    s20320104 = json['20320104'];
    s20330005 = json['20330005'];
    s20330103 = json['20330103'];
    s20330204 = json['20330204'];
    s20340005 = json['20340005'];
    s20340502 = json['20340502'];
    s20340804 = json['20340804'];
    s20400006 = json['20400006'];
    s20410005 = json['20410005'];
    s20410204 = json['20410204'];
    s20420005 = json['20420005'];
    s20420202 = json['20420202'];
    s21000006 = json['21000006'];
    s21000104 = json['21000104'];
    s21000406 = json['21000406'];
    s21000506 = json['21000506'];
    s30100006 = json['30100006'];
    s30110005 = json['30110005'];
    s30110102 = json['30110102'];
    s30110203 = json['30110203'];
    s30120005 = json['30120005'];
    s30120104 = json['30120104'];
    s30120203 = json['30120203'];
    s30120504 = json['30120504'];
    s30130005 = json['30130005'];
    s30130106 = json['30130106'];
    s30130503 = json['30130503'];
    s30200006 = json['30200006'];
    s30210005 = json['30210005'];
    s30210203 = json['30210203'];
    s30210504 = json['30210504'];
    s30220005 = json['30220005'];
    s30220204 = json['30220204'];
    s30230005 = json['30230005'];
    s30230103 = json['30230103'];
    s30230302 = json['30230302'];
    s30230504 = json['30230504'];
    s30240005 = json['30240005'];
    s30240402 = json['30240402'];
    s30300006 = json['30300006'];
    s30320005 = json['30320005'];
    s30320103 = json['30320103'];
    s30330005 = json['30330005'];
    s30340005 = json['30340005'];
    s30350005 = json['30350005'];
    s40100006 = json['40100006'];
    s40110005 = json['40110005'];
    s40110104 = json['40110104'];
    s40110504 = json['40110504'];
    s40120005 = json['40120005'];
    s40120104 = json['40120104'];
    s40120204 = json['40120204'];
    s40120304 = json['40120304'];
    s40120404 = json['40120404'];
    s40120504 = json['40120504'];
    s40120604 = json['40120604'];
    s40130005 = json['40130005'];
    s40130104 = json['40130104'];
    s40130204 = json['40130204'];
    s40130304 = json['40130304'];
    s40130404 = json['40130404'];
    s40130504 = json['40130504'];
    s40130604 = json['40130604'];
    s40200006 = json['40200006'];
    s40210005 = json['40210005'];
    s40210604 = json['40210604'];
    s40210903 = json['40210903'];
    s40220005 = json['40220005'];
    s40220104 = json['40220104'];
    s40240005 = json['40240005'];
    s40240603 = json['40240603'];
    s40240802 = json['40240802'];
    s40250005 = json['40250005'];
    s40250104 = json['40250104'];
    s50200005 = json['50200005'];
    s50200104 = json['50200104'];
    s50400005 = json['50400005'];
    s50400204 = json['50400204'];
    s50500005 = json['50500005'];
    s51000006 = json['51000006'];
    s51000203 = json['51000203'];
    s51000603 = json['51000603'];
    s51000904 = json['51000904'];
    s51001104 = json['51001104'];
    s202200006 = json['202200006'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['10100006'] = this.s10100006;
    data['10110005'] = this.s10110005;
    data['10110403'] = this.s10110403;
    data['10120005'] = this.s10120005;
    data['10120303'] = this.s10120303;
    data['10120601'] = this.s10120601;
    data['10130005'] = this.s10130005;
    data['10130604'] = this.s10130604;
    data['10300006'] = this.s10300006;
    data['10310005'] = this.s10310005;
    data['10320005'] = this.s10320005;
    data['10320103'] = this.s10320103;
    data['10320303'] = this.s10320303;
    data['10320503'] = this.s10320503;
    data['10320704'] = this.s10320704;
    data['10330005'] = this.s10330005;
    data['10330202'] = this.s10330202;
    data['10330404'] = this.s10330404;
    data['12000006'] = this.s12000006;
    data['20100006'] = this.s20100006;
    data['20100204'] = this.s20100204;
    data['20100304'] = this.s20100304;
    data['20200006'] = this.s20200006;
    data['20210005'] = this.s20210005;
    data['20210104'] = this.s20210104;
    data['20220005'] = this.s20220005;
    data['20220204'] = this.s20220204;
    data['20230005'] = this.s20230005;
    data['20230204'] = this.s20230204;
    data['20300006'] = this.s20300006;
    data['20310005'] = this.s20310005;
    data['20310203'] = this.s20310203;
    data['20310302'] = this.s20310302;
    data['20320005'] = this.s20320005;
    data['20320104'] = this.s20320104;
    data['20330005'] = this.s20330005;
    data['20330103'] = this.s20330103;
    data['20330204'] = this.s20330204;
    data['20340005'] = this.s20340005;
    data['20340502'] = this.s20340502;
    data['20340804'] = this.s20340804;
    data['20400006'] = this.s20400006;
    data['20410005'] = this.s20410005;
    data['20410204'] = this.s20410204;
    data['20420005'] = this.s20420005;
    data['20420202'] = this.s20420202;
    data['21000006'] = this.s21000006;
    data['21000104'] = this.s21000104;
    data['21000406'] = this.s21000406;
    data['21000506'] = this.s21000506;
    data['30100006'] = this.s30100006;
    data['30110005'] = this.s30110005;
    data['30110102'] = this.s30110102;
    data['30110203'] = this.s30110203;
    data['30120005'] = this.s30120005;
    data['30120104'] = this.s30120104;
    data['30120203'] = this.s30120203;
    data['30120504'] = this.s30120504;
    data['30130005'] = this.s30130005;
    data['30130106'] = this.s30130106;
    data['30130503'] = this.s30130503;
    data['30200006'] = this.s30200006;
    data['30210005'] = this.s30210005;
    data['30210203'] = this.s30210203;
    data['30210504'] = this.s30210504;
    data['30220005'] = this.s30220005;
    data['30220204'] = this.s30220204;
    data['30230005'] = this.s30230005;
    data['30230103'] = this.s30230103;
    data['30230302'] = this.s30230302;
    data['30230504'] = this.s30230504;
    data['30240005'] = this.s30240005;
    data['30240402'] = this.s30240402;
    data['30300006'] = this.s30300006;
    data['30320005'] = this.s30320005;
    data['30320103'] = this.s30320103;
    data['30330005'] = this.s30330005;
    data['30340005'] = this.s30340005;
    data['30350005'] = this.s30350005;
    data['40100006'] = this.s40100006;
    data['40110005'] = this.s40110005;
    data['40110104'] = this.s40110104;
    data['40110504'] = this.s40110504;
    data['40120005'] = this.s40120005;
    data['40120104'] = this.s40120104;
    data['40120204'] = this.s40120204;
    data['40120304'] = this.s40120304;
    data['40120404'] = this.s40120404;
    data['40120504'] = this.s40120504;
    data['40120604'] = this.s40120604;
    data['40130005'] = this.s40130005;
    data['40130104'] = this.s40130104;
    data['40130204'] = this.s40130204;
    data['40130304'] = this.s40130304;
    data['40130404'] = this.s40130404;
    data['40130504'] = this.s40130504;
    data['40130604'] = this.s40130604;
    data['40200006'] = this.s40200006;
    data['40210005'] = this.s40210005;
    data['40210604'] = this.s40210604;
    data['40210903'] = this.s40210903;
    data['40220005'] = this.s40220005;
    data['40220104'] = this.s40220104;
    data['40240005'] = this.s40240005;
    data['40240603'] = this.s40240603;
    data['40240802'] = this.s40240802;
    data['40250005'] = this.s40250005;
    data['40250104'] = this.s40250104;
    data['50200005'] = this.s50200005;
    data['50200104'] = this.s50200104;
    data['50400005'] = this.s50400005;
    data['50400204'] = this.s50400204;
    data['50500005'] = this.s50500005;
    data['51000006'] = this.s51000006;
    data['51000203'] = this.s51000203;
    data['51000603'] = this.s51000603;
    data['51000904'] = this.s51000904;
    data['51001104'] = this.s51001104;
    data['202200006'] = this.s202200006;
    return data;
  }
}
