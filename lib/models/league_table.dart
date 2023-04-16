// To parse this JSON data, do
//
//     final table = tableFromJson(jsonString);

import 'dart:convert';

Table tableFromJson(String str) => Table.fromJson(json.decode(str));

String tableToJson(Table data) => json.encode(data.toJson());

class Table {
  Table({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.currentWeek,
    required this.currentStage,
    required this.standing,
    required this.standingTab,
    required this.news,
    required this.week,
    required this.info,
    required this.weeks,
    required this.assistGoal,
    required this.assist,
    required this.goal,
    required this.calendar,
    required this.recentLiveMatches,
  });

  int currentWeek;
  int currentStage;
  DataStanding standing;
  List<StandingTab> standingTab;
  DataNews news;
  WeekClass week;
  Info info;
  List<WeekClass> weeks;
  List<Assist> assistGoal;
  List<Assist> assist;
  List<Goal> goal;
  Calendar calendar;
  List<Match> recentLiveMatches;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentWeek: json["current_week"],
        currentStage: json["current_stage"],
        standing: DataStanding.fromJson(json["standing"]),
        standingTab: List<StandingTab>.from(
            json["standing_tab"].map((x) => StandingTab.fromJson(x))),
        news: DataNews.fromJson(json["news"]),
        week: WeekClass.fromJson(json["week"]),
        info: Info.fromJson(json["info"]),
        weeks: List<WeekClass>.from(
            json["weeks"].map((x) => WeekClass.fromJson(x))),
        assistGoal: List<Assist>.from(
            json["assist_goal"].map((x) => Assist.fromJson(x))),
        assist:
            List<Assist>.from(json["assist"].map((x) => Assist.fromJson(x))),
        goal: List<Goal>.from(json["goal"].map((x) => Goal.fromJson(x))),
        calendar: Calendar.fromJson(json["calendar"]),
        recentLiveMatches: List<Match>.from(
            json["recent_live_matches"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_week": currentWeek,
        "current_stage": currentStage,
        "standing": standing.toJson(),
        "standing_tab": List<dynamic>.from(standingTab.map((x) => x.toJson())),
        "news": news.toJson(),
        "week": week.toJson(),
        "info": info.toJson(),
        "weeks": List<dynamic>.from(weeks.map((x) => x.toJson())),
        "assist_goal": List<dynamic>.from(assistGoal.map((x) => x.toJson())),
        "assist": List<dynamic>.from(assist.map((x) => x.toJson())),
        "goal": List<dynamic>.from(goal.map((x) => x.toJson())),
        "calendar": calendar.toJson(),
        "recent_live_matches":
            List<dynamic>.from(recentLiveMatches.map((x) => x.toJson())),
      };
}

class Assist {
  Assist({
    required this.playerId,
    this.assist,
    required this.penalty,
    required this.score,
    required this.player,
    required this.team,
  });

  int playerId;
  int? assist;
  int penalty;
  int score;
  Player player;
  Team team;

  factory Assist.fromJson(Map<String, dynamic> json) => Assist(
        playerId: json["player_id"],
        assist: json["assist"],
        penalty: json["penalty"],
        score: json["score"],
        player: Player.fromJson(json["player"]),
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "assist": assist,
        "penalty": penalty,
        "score": score,
        "player": player.toJson(),
        "team": team.toJson(),
      };
}

class Player {
  Player({
    required this.playerId,
    required this.nameEn,
    this.nameFa,
    this.positionFa,
    required this.image,
    this.number,
    this.marketValue,
    this.fullName,
    required this.fullBirthplace,
    this.localizedPosition,
    this.localizedName,
    this.localizedFirstName,
    this.localizedLastName,
  });

  int playerId;
  String nameEn;
  String? nameFa;
  dynamic positionFa;
  String image;
  dynamic number;
  dynamic marketValue;
  dynamic fullName;
  FullBirthplace fullBirthplace;
  dynamic localizedPosition;
  String? localizedName;
  dynamic localizedFirstName;
  dynamic localizedLastName;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerId: json["player_id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        positionFa: json["position_fa"],
        image: json["image"],
        number: json["number"],
        marketValue: json["market_value"],
        fullName: json["full_name"],
        fullBirthplace: fullBirthplaceValues.map[json["full_birthplace"]]!,
        localizedPosition: json["localized_position"],
        localizedName: json["localized_name"],
        localizedFirstName: json["localized_first_name"],
        localizedLastName: json["localized_last_name"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "name_en": nameEn,
        "name_fa": nameFa,
        "position_fa": positionFa,
        "image": image,
        "number": number,
        "market_value": marketValue,
        "full_name": fullName,
        "full_birthplace": fullBirthplaceValues.reverse[fullBirthplace],
        "localized_position": localizedPosition,
        "localized_name": localizedName,
        "localized_first_name": localizedFirstName,
        "localized_last_name": localizedLastName,
      };
}

enum FullBirthplace { empty }

final fullBirthplaceValues = EnumValues({"، ": FullBirthplace.empty});

class Team {
  Team({
    required this.teamId,
    required this.nameEn,
    required this.nameFa,
    required this.isNational,
    required this.hasTransfer,
    required this.country,
    required this.logo,
    required this.localizedName,
  });

  int teamId;
  String nameEn;
  String nameFa;
  bool isNational;
  bool hasTransfer;
  Country country;
  String logo;
  String localizedName;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        isNational: json["is_national"],
        hasTransfer: json["has_transfer"],
        country: countryValues.map[json["country"]]!,
        logo: json["logo"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "name_en": nameEn,
        "name_fa": nameFa,
        "is_national": isNational,
        "has_transfer": hasTransfer,
        "country": countryValues.reverse[country],
        "logo": logo,
        "localized_name": localizedName,
      };
}

enum Country { spain }

final countryValues = EnumValues({"Spain": Country.spain});

class Calendar {
  Calendar({
    required this.calenderId,
    required this.name,
    required this.competitionId,
    required this.startDate,
    required this.endDate,
    required this.enable,
  });

  int calenderId;
  String name;
  int competitionId;
  DateTime startDate;
  DateTime endDate;
  int enable;

  factory Calendar.fromJson(Map<String, dynamic> json) => Calendar(
        calenderId: json["calender_id"],
        name: json["name"],
        competitionId: json["competition_id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        enable: json["enable"],
      );

  Map<String, dynamic> toJson() => {
        "calender_id": calenderId,
        "name": name,
        "competition_id": competitionId,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "enable": enable,
      };
}

class Goal {
  Goal({
    required this.playerId,
    required this.goal,
    required this.penalty,
    required this.score,
    required this.player,
    required this.team,
  });

  int playerId;
  int goal;
  int penalty;
  int score;
  Player player;
  Team team;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        playerId: json["player_id"],
        goal: json["goal"],
        penalty: json["penalty"],
        score: json["score"],
        player: Player.fromJson(json["player"]),
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "goal": goal,
        "penalty": penalty,
        "score": score,
        "player": player.toJson(),
        "team": team.toJson(),
      };
}

class Info {
  Info({
    required this.competitionId,
    required this.sort,
    required this.nameEn,
    required this.nameFa,
    required this.hasTopscorer,
    required this.hasKnockoutStage,
    required this.logo,
    required this.hasStanding,
    required this.hasTransfer,
    required this.localizedName,
    required this.calendar,
  });

  int competitionId;
  int sort;
  String nameEn;
  String nameFa;
  bool hasTopscorer;
  bool hasKnockoutStage;
  String logo;
  bool hasStanding;
  bool hasTransfer;
  String localizedName;
  List<Calendar> calendar;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        competitionId: json["competition_id"],
        sort: json["sort"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        hasTopscorer: json["has_topscorer"],
        hasKnockoutStage: json["has_knockout_stage"],
        logo: json["logo"],
        hasStanding: json["has_standing"],
        hasTransfer: json["has_transfer"],
        localizedName: json["localized_name"],
        calendar: List<Calendar>.from(
            json["calendar"].map((x) => Calendar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "competition_id": competitionId,
        "sort": sort,
        "name_en": nameEn,
        "name_fa": nameFa,
        "has_topscorer": hasTopscorer,
        "has_knockout_stage": hasKnockoutStage,
        "logo": logo,
        "has_standing": hasStanding,
        "has_transfer": hasTransfer,
        "localized_name": localizedName,
        "calendar": List<dynamic>.from(calendar.map((x) => x.toJson())),
      };
}

class DataNews {
  DataNews({
    required this.data,
    required this.cursor,
  });

  List<Datum> data;
  int cursor;

  factory DataNews.fromJson(Map<String, dynamic> json) => DataNews(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cursor: json["cursor"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "cursor": cursor,
      };
}

class Datum {
  Datum({
    required this.newsId,
    required this.title,
    required this.source,
    required this.sourceUrl,
    required this.type,
    required this.isHot,
    required this.visit,
    required this.exclusive,
    required this.viewType,
    required this.submitComment,
    required this.enable,
    required this.isExternal,
    required this.language,
    required this.newsCommentCount,
    required this.updatedAt,
    required this.summary,
    required this.shareLink,
    this.promotion,
    required this.streamUrl,
    this.video,
    this.halfRateSourceUrl,
    this.halfRateStreamUrl,
    required this.newsImage,
  });

  int newsId;
  String title;
  Source source;
  String sourceUrl;
  int type;
  bool isHot;
  int visit;
  bool exclusive;
  int viewType;
  bool submitComment;
  bool enable;
  bool isExternal;
  int language;
  int newsCommentCount;
  int updatedAt;
  String summary;
  String shareLink;
  dynamic promotion;
  String streamUrl;
  NewsImage? video;
  String? halfRateSourceUrl;
  String? halfRateStreamUrl;
  List<NewsImage> newsImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        newsId: json["news_id"],
        title: json["title"],
        source: sourceValues.map[json["source"]]!,
        sourceUrl: json["source_url"],
        type: json["type"],
        isHot: json["is_hot"],
        visit: json["visit"],
        exclusive: json["exclusive"],
        viewType: json["view_type"],
        submitComment: json["submit_comment"],
        enable: json["enable"],
        isExternal: json["is_external"],
        language: json["language"],
        newsCommentCount: json["news_comment_count"],
        updatedAt: json["updated_at"],
        summary: json["summary"],
        shareLink: json["share_link"],
        promotion: json["promotion"],
        streamUrl: json["stream_url"],
        video: json["video"] == null ? null : NewsImage.fromJson(json["video"]),
        halfRateSourceUrl: json["half_rate_source_url"],
        halfRateStreamUrl: json["half_rate_stream_url"],
        newsImage: List<NewsImage>.from(
            json["news_image"].map((x) => NewsImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "news_id": newsId,
        "title": title,
        "source": sourceValues.reverse[source],
        "source_url": sourceUrl,
        "type": type,
        "is_hot": isHot,
        "visit": visit,
        "exclusive": exclusive,
        "view_type": viewType,
        "submit_comment": submitComment,
        "enable": enable,
        "is_external": isExternal,
        "language": language,
        "news_comment_count": newsCommentCount,
        "updated_at": updatedAt,
        "summary": summary,
        "share_link": shareLink,
        "promotion": promotion,
        "stream_url": streamUrl,
        "video": video?.toJson(),
        "half_rate_source_url": halfRateSourceUrl,
        "half_rate_stream_url": halfRateStreamUrl,
        "news_image": List<dynamic>.from(newsImage.map((x) => x.toJson())),
      };
}

class NewsImage {
  NewsImage({
    this.isMain,
    required this.width,
    required this.height,
    required this.url,
    this.image,
  });

  bool? isMain;
  int width;
  int height;
  String url;
  String? image;

  factory NewsImage.fromJson(Map<String, dynamic> json) => NewsImage(
        isMain: json["is_main"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "is_main": isMain,
        "width": width,
        "height": height,
        "url": url,
        "image": image,
      };
}

enum Source { empty }

final sourceValues = EnumValues({"فوتبالی": Source.empty});

class Match {
  Match({
    required this.matchId,
    required this.homeTeamId,
    required this.awayTeamId,
    this.competitionId,
    this.homeTeamAgg,
    this.awayTeamAgg,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.homeTeamPen,
    required this.awayTeamPen,
    this.stadiumId,
    required this.week,
    this.liveUrl,
    this.homeTeamHalfScore,
    this.awayTeamHalfScore,
    required this.timestamp,
    required this.currentPeriod,
    required this.matchStarted,
    required this.hasPrediction,
    required this.tvChannel,
    required this.predictable,
    this.oldStatus,
    this.liveStreamUrl,
    required this.hasVideo,
    required this.matchEnded,
    required this.hasNews,
    required this.useTimestamp,
    required this.dateText,
    required this.hasLive,
    required this.shortDateText,
    required this.midDateText,
    required this.weekNumber,
    required this.hasDetails,
    required this.hasHeadToHead,
    required this.longDateText,
    required this.showStreamLogo,
    this.calendarText,
    required this.location,
    this.challenge,
    required this.status,
    this.channel,
    this.periods,
    required this.homeTeam,
    required this.awayTeam,
    this.stage,
    required this.news,
    this.hasEvent,
    this.hasLineup,
    this.stadium,
  });

  int matchId;
  int homeTeamId;
  int awayTeamId;
  int? competitionId;
  int? homeTeamAgg;
  int? awayTeamAgg;
  int homeTeamScore;
  int awayTeamScore;
  int homeTeamPen;
  int awayTeamPen;
  int? stadiumId;
  WeekEnum week;
  dynamic liveUrl;
  int? homeTeamHalfScore;
  int? awayTeamHalfScore;
  int timestamp;
  int currentPeriod;
  bool matchStarted;
  bool hasPrediction;
  int tvChannel;
  bool predictable;
  String? oldStatus;
  String? liveStreamUrl;
  bool hasVideo;
  bool matchEnded;
  bool hasNews;
  bool useTimestamp;
  String dateText;
  bool hasLive;
  String shortDateText;
  String midDateText;
  int weekNumber;
  bool hasDetails;
  bool hasHeadToHead;
  String longDateText;
  bool showStreamLogo;
  dynamic calendarText;
  Location location;
  dynamic challenge;
  StatusEnum status;
  dynamic channel;
  List<dynamic>? periods;
  Team homeTeam;
  Team awayTeam;
  Sta? stage;
  List<NewsElement> news;
  bool? hasEvent;
  bool? hasLineup;
  Sta? stadium;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchId: json["match_id"],
        homeTeamId: json["home_team_id"],
        awayTeamId: json["away_team_id"],
        competitionId: json["competition_id"],
        homeTeamAgg: json["home_team_agg"],
        awayTeamAgg: json["away_team_agg"],
        homeTeamScore: json["home_team_score"],
        awayTeamScore: json["away_team_score"],
        homeTeamPen: json["home_team_pen"],
        awayTeamPen: json["away_team_pen"],
        stadiumId: json["stadium_id"],
        week: weekEnumValues.map[json["week"]]!,
        liveUrl: json["live_url"],
        homeTeamHalfScore: json["home_team_half_score"],
        awayTeamHalfScore: json["away_team_half_score"],
        timestamp: json["timestamp"],
        currentPeriod: json["current_period"],
        matchStarted: json["match_started"],
        hasPrediction: json["has_prediction"],
        tvChannel: json["tv_channel"],
        predictable: json["predictable"],
        oldStatus: json["old_status"],
        liveStreamUrl: json["live_stream_url"],
        hasVideo: json["has_video"],
        matchEnded: json["match_ended"],
        hasNews: json["has_news"],
        useTimestamp: json["use_timestamp"],
        dateText: json["date_text"],
        hasLive: json["has_live"],
        shortDateText: json["short_date_text"],
        midDateText: json["mid_date_text"],
        weekNumber: json["week_number"],
        hasDetails: json["has_details"],
        hasHeadToHead: json["has_head_to_head"],
        longDateText: json["long_date_text"],
        showStreamLogo: json["show_stream_logo"],
        calendarText: json["calendar_text"],
        location: Location.fromJson(json["location"]),
        challenge: json["challenge"],
        status: statusEnumValues.map[json["status"]]!,
        channel: json["channel"],
        periods: json["periods"] == null
            ? []
            : List<dynamic>.from(json["periods"]!.map((x) => x)),
        homeTeam: Team.fromJson(json["home_team"]),
        awayTeam: Team.fromJson(json["away_team"]),
        stage: json["stage"] == null ? null : Sta.fromJson(json["stage"]),
        news: List<NewsElement>.from(
            json["news"].map((x) => NewsElement.fromJson(x))),
        hasEvent: json["has_event"],
        hasLineup: json["has_lineup"],
        stadium: json["stadium"] == null ? null : Sta.fromJson(json["stadium"]),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "home_team_id": homeTeamId,
        "away_team_id": awayTeamId,
        "competition_id": competitionId,
        "home_team_agg": homeTeamAgg,
        "away_team_agg": awayTeamAgg,
        "home_team_score": homeTeamScore,
        "away_team_score": awayTeamScore,
        "home_team_pen": homeTeamPen,
        "away_team_pen": awayTeamPen,
        "stadium_id": stadiumId,
        "week": weekEnumValues.reverse[week],
        "live_url": liveUrl,
        "home_team_half_score": homeTeamHalfScore,
        "away_team_half_score": awayTeamHalfScore,
        "timestamp": timestamp,
        "current_period": currentPeriod,
        "match_started": matchStarted,
        "has_prediction": hasPrediction,
        "tv_channel": tvChannel,
        "predictable": predictable,
        "old_status": oldStatus,
        "live_stream_url": liveStreamUrl,
        "has_video": hasVideo,
        "match_ended": matchEnded,
        "has_news": hasNews,
        "use_timestamp": useTimestamp,
        "date_text": dateText,
        "has_live": hasLive,
        "short_date_text": shortDateText,
        "mid_date_text": midDateText,
        "week_number": weekNumber,
        "has_details": hasDetails,
        "has_head_to_head": hasHeadToHead,
        "long_date_text": longDateText,
        "show_stream_logo": showStreamLogo,
        "calendar_text": calendarText,
        "location": location.toJson(),
        "challenge": challenge,
        "status": statusEnumValues.reverse[status],
        "channel": channel,
        "periods":
            periods == null ? [] : List<dynamic>.from(periods!.map((x) => x)),
        "home_team": homeTeam.toJson(),
        "away_team": awayTeam.toJson(),
        "stage": stage?.toJson(),
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "has_event": hasEvent,
        "has_lineup": hasLineup,
        "stadium": stadium?.toJson(),
      };
}

class Location {
  Location({
    required this.nameEn,
    this.nameFa,
    this.lat,
    this.long,
  });

  Country nameEn;
  dynamic nameFa;
  dynamic lat;
  dynamic long;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        nameEn: countryValues.map[json["name_en"]]!,
        nameFa: json["name_fa"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "name_en": countryValues.reverse[nameEn],
        "name_fa": nameFa,
        "lat": lat,
        "long": long,
      };
}

class NewsElement {
  NewsElement({
    required this.sourceUrl,
    required this.updatedAt,
    required this.summary,
    required this.shareLink,
    this.promotion,
    required this.streamUrl,
    this.video,
  });

  String sourceUrl;
  int updatedAt;
  String summary;
  String shareLink;
  dynamic promotion;
  String streamUrl;
  dynamic video;

  factory NewsElement.fromJson(Map<String, dynamic> json) => NewsElement(
        sourceUrl: json["source_url"],
        updatedAt: json["updated_at"],
        summary: json["summary"],
        shareLink: json["share_link"],
        promotion: json["promotion"],
        streamUrl: json["stream_url"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "source_url": sourceUrl,
        "updated_at": updatedAt,
        "summary": summary,
        "share_link": shareLink,
        "promotion": promotion,
        "stream_url": streamUrl,
        "video": video,
      };
}

class Sta {
  Sta({
    required this.id,
    required this.nameEn,
    required this.nameFa,
    this.image,
    this.localizedName,
  });

  int id;
  String nameEn;
  String nameFa;
  String? image;
  String? localizedName;

  factory Sta.fromJson(Map<String, dynamic> json) => Sta(
        id: json["id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        image: json["image"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_fa": nameFa,
        "image": image,
        "localized_name": localizedName,
      };
}

enum StatusEnum { empty, the_65, the_1900 }

final statusEnumValues = EnumValues({
  "پایان": StatusEnum.empty,
  "19:00": StatusEnum.the_1900,
  "65 ′ ": StatusEnum.the_65
});

enum WeekEnum { the_29 }

final weekEnumValues = EnumValues({"هفته 29": WeekEnum.the_29});

class DataStanding {
  DataStanding({
    required this.standings,
    required this.standingsHome,
    required this.standingsAway,
    required this.statuses,
  });

  List<StandingsAwayElement> standings;
  List<StandingsAwayElement> standingsHome;
  List<StandingsAwayElement> standingsAway;
  List<StatusElement> statuses;

  factory DataStanding.fromJson(Map<String, dynamic> json) => DataStanding(
        standings: List<StandingsAwayElement>.from(
            json["standings"].map((x) => StandingsAwayElement.fromJson(x))),
        standingsHome: List<StandingsAwayElement>.from(json["standings_home"]
            .map((x) => StandingsAwayElement.fromJson(x))),
        standingsAway: List<StandingsAwayElement>.from(json["standings_away"]
            .map((x) => StandingsAwayElement.fromJson(x))),
        statuses: List<StatusElement>.from(
            json["statuses"].map((x) => StatusElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "standings": List<dynamic>.from(standings.map((x) => x.toJson())),
        "standings_home":
            List<dynamic>.from(standingsHome.map((x) => x.toJson())),
        "standings_away":
            List<dynamic>.from(standingsAway.map((x) => x.toJson())),
        "statuses": List<dynamic>.from(statuses.map((x) => x.toJson())),
      };
}

class StandingsAwayElement {
  StandingsAwayElement({
    this.groupFa,
    this.group,
    required this.standings,
  });

  dynamic groupFa;
  dynamic group;
  List<StandingsAwayStanding> standings;

  factory StandingsAwayElement.fromJson(Map<String, dynamic> json) =>
      StandingsAwayElement(
        groupFa: json["group_fa"],
        group: json["group"],
        standings: List<StandingsAwayStanding>.from(
            json["standings"].map((x) => StandingsAwayStanding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "group_fa": groupFa,
        "group": group,
        "standings": List<dynamic>.from(standings.map((x) => x.toJson())),
      };
}

class StandingsAwayStanding {
  StandingsAwayStanding({
    required this.competitionId,
    required this.recentMatch,
    required this.position,
    required this.matchPlayed,
    required this.win,
    required this.lose,
    required this.draw,
    required this.goalScored,
    required this.goalAgainst,
    required this.overallPoint,
    this.round,
    this.status,
    this.group,
    this.groupFa,
    this.isOngoing,
    required this.team,
    this.teamId,
    this.calendarId,
  });

  int competitionId;
  String recentMatch;
  int position;
  int matchPlayed;
  int win;
  int lose;
  int draw;
  int goalScored;
  int goalAgainst;
  int overallPoint;
  dynamic round;
  StatusElement? status;
  dynamic group;
  dynamic groupFa;
  bool? isOngoing;
  Team team;
  int? teamId;
  int? calendarId;

  factory StandingsAwayStanding.fromJson(Map<String, dynamic> json) =>
      StandingsAwayStanding(
        competitionId: json["competition_id"],
        recentMatch: json["recent_match"],
        position: json["position"],
        matchPlayed: json["match_played"],
        win: json["win"],
        lose: json["lose"],
        draw: json["draw"],
        goalScored: json["goal_scored"],
        goalAgainst: json["goal_against"],
        overallPoint: json["overall_point"],
        round: json["round"],
        status: json["status"] == null
            ? null
            : StatusElement.fromJson(json["status"]),
        group: json["group"],
        groupFa: json["group_fa"],
        isOngoing: json["is_ongoing"],
        team: Team.fromJson(json["team"]),
        teamId: json["team_id"],
        calendarId: json["calendar_id"],
      );

  Map<String, dynamic> toJson() => {
        "competition_id": competitionId,
        "recent_match": recentMatch,
        "position": position,
        "match_played": matchPlayed,
        "win": win,
        "lose": lose,
        "draw": draw,
        "goal_scored": goalScored,
        "goal_against": goalAgainst,
        "overall_point": overallPoint,
        "round": round,
        "status": status?.toJson(),
        "group": group,
        "group_fa": groupFa,
        "is_ongoing": isOngoing,
        "team": team.toJson(),
        "team_id": teamId,
        "calendar_id": calendarId,
      };
}

class StatusElement {
  StatusElement({
    required this.text,
    required this.color,
  });

  String text;
  String color;

  factory StatusElement.fromJson(Map<String, dynamic> json) => StatusElement(
        text: json["text"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "color": color,
      };
}

class StandingTab {
  StandingTab({
    required this.competitionId,
    required this.nameEn,
    required this.nameFa,
    required this.hasTopscorer,
    required this.logo,
    required this.localizedName,
  });

  int competitionId;
  String nameEn;
  String nameFa;
  bool hasTopscorer;
  String logo;
  String localizedName;

  factory StandingTab.fromJson(Map<String, dynamic> json) => StandingTab(
        competitionId: json["competition_id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        hasTopscorer: json["has_topscorer"],
        logo: json["logo"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "competition_id": competitionId,
        "name_en": nameEn,
        "name_fa": nameFa,
        "has_topscorer": hasTopscorer,
        "logo": logo,
        "localized_name": localizedName,
      };
}

class WeekClass {
  WeekClass({
    required this.week,
    required this.timestamp,
    required this.dateText,
    required this.weekNumber,
    required this.stageId,
    this.matches,
    required this.currentTab,
  });

  String week;
  int timestamp;
  String dateText;
  int weekNumber;
  int stageId;
  List<Match>? matches;
  bool currentTab;

  factory WeekClass.fromJson(Map<String, dynamic> json) => WeekClass(
        week: json["week"],
        timestamp: json["timestamp"],
        dateText: json["date_text"],
        weekNumber: json["week_number"],
        stageId: json["stage_id"],
        matches: json["matches"] == null
            ? []
            : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
        currentTab: json["current_tab"],
      );

  Map<String, dynamic> toJson() => {
        "week": week,
        "timestamp": timestamp,
        "date_text": dateText,
        "week_number": weekNumber,
        "stage_id": stageId,
        "matches": matches == null
            ? []
            : List<dynamic>.from(matches!.map((x) => x.toJson())),
        "current_tab": currentTab,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
