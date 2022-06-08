import 'package:summer_project/accoladesItem.dart';

class Accolades {
  AccoladesItem bloodThirsty(double score) {
    return AccoladesItem(
        value: 1,
        title: "Bloodthirsty",
        description:
            "This player is hunting for blood every game! Average kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem pinkWards(double score) {
    return AccoladesItem(
        value: 2,
        title: "ControllWards<3",
        description:
            "This player is making sure his teams bushes are safe! Average amount of Pink wards bought last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem baronRaider(double score) {
    return AccoladesItem(
        value: 1,
        title: "Mythic Raider",
        description:
            "This player is an Echo level raider at taking barons! Average baron kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem lateGameLover(double score) {
    return AccoladesItem(
        value: 1,
        title: "Late Game Lover",
        description:
            "This player usually stalls out games! Average end game level last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem demolisher(double score) {
    return AccoladesItem(
        value: 1,
        title: "Demolisher",
        description:
            "This player loves to siege structures! Average damage to structures last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem diesAlot(double score) {
    return AccoladesItem(
        value: 1,
        title: "Dies a lot",
        description:
            "This player might love the color grey a bit to much! Average deaths last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem dragonTamer(double score) {
    return AccoladesItem(
        value: 1,
        title: "Dragon Tamer",
        description:
            "This player know how to tame(kill) the dragons of summoners rift! Average dragon kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem firstBloodExpert(double score) {
    return AccoladesItem(
        value: 1,
        title: "First Blood Expert",
        description:
            "This player does not hestitate to start the action early! Average first bloods last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem killingSpree(double score) {
    return AccoladesItem(
        value: 1,
        title: "Killing Spree!",
        description:
            "Killing spree might be blasting your headphones often with this player! Average killing sprees last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem epicStealer(double score) {
    return AccoladesItem(
        value: 1,
        title: "Epic Stealer",
        description:
            "Make sure you ready your smite and train your reflexs against this player! Average objectives stolen last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem godGamer(double score) {
    return AccoladesItem(
        value: 1,
        title: "God Gamer",
        description:
            "How does he even get this good at killing champions?! Average Penta Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem highDamage(double score) {
    return AccoladesItem(
        value: 1,
        title: "High Damage!",
        description:
            "This player is looking real good on the damage meters! Average Damage Dealt to Champions last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem tank(double score) {
    return AccoladesItem(
        value: 1,
        title: "Tank",
        description:
            "This player likes to soak damage for his team! For good or for bad =D Average Damage Dealt to Champions last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem turretKiller(double score) {
    return AccoladesItem(
        value: 1,
        title: "Turret Killer",
        description:
            "Might want to rethink roaming against this player! Average Turret Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem visionLegend(double score) {
    return AccoladesItem(
        value: 1,
        title: "Vision Legend",
        description:
            "Your wards have nightmares about this player! Average Vision Score last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badVision(double score) {
    return AccoladesItem(
        value: 1,
        title: "Bad Vision",
        description:
            "Trinkets are free! Drop some wards my man! Average Vision Score last 30 games is ",
        score: score,
        positive: false);
  }
}
