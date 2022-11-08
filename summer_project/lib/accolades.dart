import 'package:summer_project/accoladesItem.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class Accolades {
  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;
  List<AccoladesItem> accoladeList = [];
  Accolades(this.matchHistoryTotals, this.games);

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
        value: 3,
        title: "ControllWards",
        description:
            "This player is making sure his teams bushes are safe! Average amount of Pink wards bought last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem baronRaider(double score) {
    return AccoladesItem(
        value: 2,
        title: "Mythic Raider",
        description:
            "This player is an Echo level raider at taking barons! Average baron kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem lateGameLover(double score) {
    return AccoladesItem(
        value: 3,
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
        value: 2,
        title: "Dies a lot",
        description:
            "This player might love the color grey a bit to much! Average deaths last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem dragonTamer(double score) {
    return AccoladesItem(
        value: 2,
        title: "Dragon Tamer",
        description:
            "This player know how to tame(kill) the dragons of summoners rift! Average dragon kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem firstBloodExpert(double score) {
    return AccoladesItem(
        value: 2,
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
        value: 0,
        title: "Epic Stealer",
        description:
            "Make sure you ready your smite and train your reflexs against this player! Average objectives stolen last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem godGamer(double score) {
    return AccoladesItem(
        value: 0,
        title: "God Gamer",
        description:
            "How does he even get this good at killing champions?! Average Penta Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem highDamage(double score) {
    return AccoladesItem(
        value: 2,
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
            "This player likes to soak damage for his team! For good or for bad =D Average Team Damage % last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem turretKiller(double score) {
    return AccoladesItem(
        value: 2,
        title: "Turret Killer",
        description:
            "Might want to rethink roaming against this player! Average Turret Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem visionLegend(double score) {
    return AccoladesItem(
        value: 3,
        title: "Vision Legend",
        description:
            "Your wards have nightmares about this player! Average Vision Score last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badVision(double score) {
    return AccoladesItem(
        value: 3,
        title: "Bad Vision",
        description:
            "Trinkets are free! Drop some wards my man! Average Vision Score last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem earlyTeamfighter(double score) {
    return AccoladesItem(
        value: 1,
        title: "Early Brawler",
        description:
            "This player leaves his lane to brawl early! Average Aces before min 15 last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem jungleThief(double score) {
    return AccoladesItem(
        value: 2,
        title: "Jungle Thief",
        description:
            "This player likes to spend his time taking your jungles precious resources! Average buffs stolen last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem jungleInvader(double score) {
    return AccoladesItem(
        value: 3,
        title: "Jungle Invader",
        description:
            "This player likes to spend his time taking your jungles precious resources! Average camps stolen last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem maxtrixDodger(double score) {
    return AccoladesItem(
        value: 2,
        title: "Matrix Dodges",
        description:
            "Keanu would be proud! Amount of skillshots dodged in a small Window last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem multiKiller(double score) {
    return AccoladesItem(
        value: 1,
        title: "Multikiller",
        description:
            "Kill Secure expert or Solo carry? Average Multikills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem surrender(double score) {
    return AccoladesItem(
        value: 3,
        title: "Surrenders?",
        description:
            "This player might be easily tilted! Surrenders last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem goldHoarder(double score) {
    return AccoladesItem(
        value: 3,
        title: "Gold Hoarder",
        description:
            "This player often gains big amounts of gold! Average gold last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem moneyMaker(double score) {
    return AccoladesItem(
        value: 2,
        title: "Money Maker",
        description:
            "This player makes Money Rain! Average gold per minute last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem comebackKid(double score) {
    return AccoladesItem(
        value: 0,
        title: "Comeback Kid",
        description:
            "This player fights to the very end! Wins with an open base last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem layup(double score) {
    return AccoladesItem(
        value: 3,
        title: "Layup Efficient",
        description:
            "This player usually sets up his kills with a teammate! Immobilize and kill with an ally last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem powerFarmer(double score) {
    return AccoladesItem(
        value: 2,
        title: "Power Farmer",
        description:
            "Rushing throw the jungle! Average jungle CS before 10m last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem slowFarmer(double score) {
    return AccoladesItem(
        value: 3,
        title: "Slow Farmer",
        description:
            "Taking his time in the jungle! Average jungle CS before 10m last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem kpExpert(double score) {
    return AccoladesItem(
        value: 1,
        title: "KP Expert",
        description: "High Kill Participation! Average last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badKp(double score) {
    return AccoladesItem(
        value: 3,
        title: "Bad KP",
        description: "High Kill Participation! Average last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem hardToDive(double score) {
    return AccoladesItem(
        value: 2,
        title: "Hard to Dive",
        description:
            "Careful diving this player! Average kills under own turret last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem highPrecision(double score) {
    return AccoladesItem(
        value: 2,
        title: "High Precision",
        description:
            "Suspiciuously good with Skillshots! Average skillshots landed before 10m last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem goodCS(double score) {
    return AccoladesItem(
        value: 1,
        title: "Good CS",
        description:
            "This player does not miss CS! Average CS before 10m last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badCS(double score) {
    return AccoladesItem(
        value: 3,
        title: "Bad CS",
        description:
            "This player might miss quite a few CS! Average CS before 10m last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem legendaryGamer(double score) {
    return AccoladesItem(
        value: 0,
        title: "Legendary",
        description:
            "Legendary Gamer! Amount of times being legendary last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem laneBully(double score) {
    return AccoladesItem(
        value: 3,
        title: "Lane Bully",
        description:
            "This player might crush you in lane! Average Max Cs Advantage on lane opponent last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem heraldUsage(double score) {
    return AccoladesItem(
        value: 1,
        title: "Herald Usage",
        description:
            "Good Herald Usage! Multi turrets with Herald last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem outplayArtist(double score) {
    return AccoladesItem(
        value: 2,
        title: "Outplay Artist",
        description: "Faker what was that! Outnumbered kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem unkillable(double score) {
    return AccoladesItem(
        value: 0,
        title: "unkillable",
        description: "Cant be touched! Games with 0 deaths last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem cleanseAbuse(double score) {
    return AccoladesItem(
        value: 2,
        title: "Cleanse Abuser",
        description: "Good with Cleanse! Quick cleanses last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem oneshots(double score) {
    return AccoladesItem(
        value: 1,
        title: "Oneshots",
        description: "Almost feels unfair! Quick solo kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem soloBolo(double score) {
    return AccoladesItem(
        value: 1,
        title: "SoloBolo",
        description: "SoloBolo Expert! Solo kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem baronSolo(double score) {
    return AccoladesItem(
        value: 0,
        title: "Baron Solos",
        description:
            "Careful this player might sneak baron solo! Solo barons last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem guardianAngel(double score) {
    return AccoladesItem(
        value: 3,
        title: "Guardian",
        description:
            "Your personal Guardian Angel! Saved Allies from death last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem scuttleWarrior(double score) {
    return AccoladesItem(
        value: 2,
        title: "Scuttle Warrior",
        description:
            "This player fights for the Scuttle Crab! Scuttle Crab kills Average last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem dpsThreat(double score) {
    return AccoladesItem(
        value: 1,
        title: "Dps Threat",
        description:
            "Topping the charts! Damage per minute Average last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem greatWith(double score, String? champName) {
    return AccoladesItem(
        value: 1,
        title: "Great With " + champName!,
        description:
            "This player is great with $champName ! Winrate last games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badWith(double score, String? champName) {
    return AccoladesItem(
        value: 3,
        title: "Bad With " + champName!,
        description:
            "This player is bad with $champName ! Winrate last games is ",
        score: score,
        positive: false);
  }

  AccoladesItem champLover(double score, String? champName) {
    return AccoladesItem(
        value: 2,
        title: champName! + "Lover",
        description:
            "This player currently likes to play $champName ! $champName Games Played Last 30 games ",
        score: score,
        positive: true);
  }

  AccoladesItem champMain(double score, String? champName) {
    return AccoladesItem(
        value: 2,
        title: champName! + "Main",
        description:
            "This player is currently maining $champName ! $champName Games Played Last 30 games ",
        score: score,
        positive: true);
  }

  AccoladesItem winStreak(double score) {
    return AccoladesItem(
        value: 1,
        title: "Win Streak",
        description: "This player is on a winstreak! Consecutive wins ",
        score: score,
        positive: true);
  }

  AccoladesItem loseStreak(double score) {
    return AccoladesItem(
        value: 1,
        title: "Lose Streak",
        description: "This player is on a losstreak! Consecutive losses ",
        score: score,
        positive: false);
  }

  AccoladesItem stomped(double score) {
    return AccoladesItem(
        value: 1,
        title: "Stomped",
        description: "This player got ran over last game! Cheer him up!",
        score: score,
        positive: false);
  }

  AccoladesItem premade(double score) {
    return AccoladesItem(
        value: 2,
        title: "Premade",
        description:
            "This player has " + score.toStringAsFixed(0) + " with PLAYERNAME!",
        score: score,
        positive: true);
  }
}
